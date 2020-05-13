package com.csci448.alperenugus_a3.ui.Map

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.IntentSender
import android.content.SharedPreferences
import android.content.pm.PackageManager
import android.location.Geocoder
import android.location.Location
import android.os.Bundle
import android.util.Log
import android.view.*
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.preference.Preference
import androidx.preference.PreferenceManager
import com.csci448.alperenugus_a3.MainActivity
import com.csci448.alperenugus_a3.R
import com.csci448.alperenugus_a3.api.Main
import com.csci448.alperenugus_a3.api.Weather
import com.csci448.alperenugus_a3.api.WeatherService
import com.csci448.alperenugus_a3.data.HistoryModel
import com.google.android.gms.common.api.ResolvableApiException
import com.google.android.gms.location.*
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.LatLngBounds
import com.google.android.gms.maps.model.Marker
import com.google.android.gms.maps.model.MarkerOptions
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import java.io.IOException
import java.util.*
import java.util.regex.Matcher
import java.util.regex.Pattern

private const val logTag = "MapFragment"
private const val FINE_LOCATION_PERMISSION =
    android.Manifest.permission.ACCESS_FINE_LOCATION
private const val REQUEST_LOC_PERMISSION = 1

class MapFragment: Fragment(), GoogleMap.OnMarkerClickListener {

    private lateinit var googleMapFragment: SupportMapFragment
    private lateinit var googleMap: GoogleMap
    private lateinit var fab: FloatingActionButton

    private lateinit var locationRequest: LocationRequest
    private lateinit var fusedLocationProviderClient:
            FusedLocationProviderClient
    private lateinit var locationCallback: LocationCallback
    private lateinit var lastLocation: Location

    private lateinit var factory: MapViewModelFactory

    private val weatherService: WeatherService = WeatherService()

    private lateinit var prefs: SharedPreferences


    private val mapViewModel: MapViewModel by lazy {
        ViewModelProvider(this@MapFragment, factory)
            .get(MapViewModel::class.java)
    }

    companion object{
        const val REQUEST_LOC_ON = 0
        private var locationUpdateState = false
    }


    override fun onAttach(context: Context) {
        Log.d(logTag, "onAttach() called")
        super.onAttach(context)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        Log.d(logTag, "onCreate() called")
        super.onCreate(savedInstanceState)

        factory = MapViewModelFactory(requireContext())

        // Init location request features
        locationRequest = LocationRequest.create()
        locationRequest.interval = 0
        locationRequest.numUpdates = 1
        locationRequest.priority = LocationRequest.PRIORITY_HIGH_ACCURACY
        fusedLocationProviderClient =
            LocationServices.getFusedLocationProviderClient(requireContext())

        // Get preferences
        prefs = PreferenceManager.getDefaultSharedPreferences(requireContext())

        locationCallback = object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult) {
                super.onLocationResult(locationResult)
                Log.d(logTag, "Got a location: ${locationResult.lastLocation}")
                lastLocation = locationResult.lastLocation

                MainActivity.sharedLocation = LatLng(lastLocation.latitude, lastLocation.longitude)

                // Check-in if preferences is set to true
                if(prefs.getBoolean("database_save", false)){
                    checkIn()
                }
                updateUI()
            }
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d(logTag, "onCreateView() called")

        val view = inflater.inflate(R.layout.fragment_map, container, false)

        fab = view.findViewById(R.id.fab)

        // onClick listener for floating action button
        fab.setOnClickListener { view ->
            checkPermissionAndGetLocation()
        }

        googleMapFragment =
            childFragmentManager.findFragmentById(R.id.google_map_fragment) as SupportMapFragment

        // When google maps is ready
        googleMapFragment.getMapAsync { map ->
            googleMap = map
            googleMap.setOnMarkerClickListener(this)
            googleMap.setOnMapLoadedCallback {

            }
        }

        // Add past check-in markers to the map
        mapViewModel.history.observe(
            viewLifecycleOwner,
            androidx.lifecycle.Observer{
                    history -> history.let {

                history.forEachIndexed { index, historyModel ->
                    val myLocationPoint = LatLng(historyModel.lat,
                        historyModel.lng)

                    var myMarker = MarkerOptions()
                        .position(myLocationPoint)

                    myMarker.title("Lat/Lng: (${myLocationPoint.latitude} , ${myLocationPoint.longitude})")
                    googleMap.addMarker(myMarker)
                }
            }
            }
        )
        // Check if location can be retrieved, if not ask user
        checkIfLocationCanBeRetrieved()
        return view
    }

    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        Log.d(logTag, "onCreateOptionsMenu() called")
        super.onCreateOptionsMenu(menu, inflater)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        Log.d(logTag, "onOptionsItemSelected() called")
        return super.onOptionsItemSelected(item)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        Log.d(logTag, "onViewCreated() called")
        super.onViewCreated(view, savedInstanceState)
    }

    override fun onActivityCreated(p0: Bundle?) {
        Log.d(logTag, "onActivityCreated() called")
        super.onActivityCreated(p0)
    }

    override fun onStart() {
        Log.d(logTag, "onStart() called")
        super.onStart()
    }

    override fun onResume() {
        Log.d(logTag, "onResume() called")
        super.onResume()
    }

    override fun onPause() {
        Log.d(logTag, "onPause() called")
        super.onPause()
    }

    override fun onDestroyView() {
        Log.d(logTag, "onDestroyView() called")
        super.onDestroyView()
    }

    override fun onDestroy() {
        Log.d(logTag, "onDestroy() called")
        super.onDestroy()
    }

    override fun onDetach() {
        Log.d(logTag, "onDetach() called")
        super.onDetach()
    }

    private fun updateUI() {
        // make sure we have a map and a location
        if( !::googleMap.isInitialized || !::lastLocation.isInitialized ) {
            return
        }
        // create a point for the corresponding lat/long
        val myLocationPoint = LatLng(lastLocation.latitude,
            lastLocation.longitude)
        // Step 3 will go here
        // create the marker
        var myMarker = MarkerOptions()
            .position(myLocationPoint)

        // getAddress returns empty string
        if(getAddress(lastLocation) == ""){
            myMarker.title("Lat/Lng: (${lastLocation.latitude} , ${lastLocation.longitude})")
            Log.d(logTag, "getAddress(lastLocation) == empty")
            Log.d(logTag, myMarker.title)
        }
        // Address found
        else{
            myMarker.title( getAddress(lastLocation))
            Log.d(logTag, "else")
            Log.d(logTag, myMarker.title)
        }

        Log.d(logTag, "Title: ${getAddress(lastLocation)}")

        if(!prefs.getBoolean("database_save", false)){
            googleMap.addMarker(myMarker)
        }

        // include all points that should be within the bounds of the zoom
        // convex hull
        val bounds = LatLngBounds.Builder()
            .include(myLocationPoint)
            .build()
        // add a margin
        val margin = resources.getDimensionPixelSize(R.dimen.map_inset_margin)
        // create a camera to smoothly move the map view
        val cameraUpdate = CameraUpdateFactory.newLatLngBounds(bounds, margin)
        // move our camera!
        googleMap.animateCamera(cameraUpdate)
    }

    private fun checkIfLocationCanBeRetrieved() {
        val builder = LocationSettingsRequest.Builder()
            .addLocationRequest(locationRequest)
        val client = LocationServices.getSettingsClient(requireActivity())
        val task = client.checkLocationSettings(builder.build())
        task.addOnSuccessListener {
            locationUpdateState = true
        }
        task.addOnFailureListener {exc ->
            locationUpdateState = false
            if(exc is ResolvableApiException) {
                try {
                    exc.startResolutionForResult(requireActivity(), REQUEST_LOC_ON)
                } catch (e: IntentSender.SendIntentException) {
                    // do nothing, they cancelled so ignore error
                }
            }
        }
    }

    private fun checkPermissionAndGetLocation(){
        Log.d(logTag, "checkPermissionAndGetLocation() called")

        if(ContextCompat.checkSelfPermission(requireActivity(),
                FINE_LOCATION_PERMISSION )!= PackageManager.PERMISSION_GRANTED
        ){

            if(ActivityCompat.shouldShowRequestPermissionRationale(requireActivity(), FINE_LOCATION_PERMISSION)){
                Toast.makeText(requireContext(), R.string.permission_not_granted, Toast.LENGTH_SHORT).show();
                Log.d(logTag, "No permission")
            }
            else{
                ActivityCompat.requestPermissions(requireActivity(), arrayOf(
                    FINE_LOCATION_PERMISSION), REQUEST_LOC_PERMISSION )
                Log.d(logTag, "I am here")
            }
        }
        else{
            fusedLocationProviderClient.requestLocationUpdates(locationRequest,
                locationCallback, null)
            Log.d(logTag, "Thank you!")

        }
    }

    // Get address from coordinates
    private fun getAddress(location: Location): String {
        val geocoder = Geocoder(requireActivity())
        val addressTextBuilder = StringBuilder()
        try {
            val addresses = geocoder.getFromLocation(location.latitude,
                location.longitude,
                1)
            if(addresses != null && addresses.isNotEmpty()) {
                val address = addresses[0]
                for(i in 0..address.maxAddressLineIndex) {
                    if(i > 0) {
                        addressTextBuilder.append( "\n" )
                    }
                    addressTextBuilder.append( address.getAddressLine(i) )
                }
            }
        } catch (e: IOException) {
            Log.e(logTag, e.localizedMessage)
        }
        return addressTextBuilder.toString()
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data:
    Intent?) {
        Log.d(logTag, "onActivityResult() is called")
        Log.d(logTag, "requestCode = $requestCode")
        if(resultCode != Activity.RESULT_OK) {
            return
        }
        if(requestCode == REQUEST_LOC_ON) {
            locationUpdateState = true
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {

        if(requestCode == REQUEST_LOC_PERMISSION){
            if(permissions.isNotEmpty() && permissions[0] == FINE_LOCATION_PERMISSION
                && grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED
            ){
                checkPermissionAndGetLocation()
            }
            else{
                super.onRequestPermissionsResult(requestCode, permissions, grantResults)
            }
        }
    }

    // Markers' click listeners
    override fun onMarkerClick(p0: Marker?): Boolean {
        view?.let {
            if (p0 != null) {
                var historyModel: HistoryModel? = null

                // Get the clicked marker's historyModel from the database
                mapViewModel.history.observe(
                    viewLifecycleOwner,
                    androidx.lifecycle.Observer { result ->
                        result.let {
                            result.forEach {
                                if (it.lat == p0.position.latitude && it.lng == p0.position.longitude) {
                                    historyModel = it
                                }
                            }
                        }

                    }
                )

                // Marker's snackbar delete listener
                if(historyModel?.dateTime != null && historyModel?.temp != null && historyModel?.weatherDescription != null){
                    Snackbar.make(it, "You were here: ${historyModel?.dateTime.toString()}\n" +
                            "Temp: ${historyModel?.temp.toString()} " +
                            "(${historyModel?.weatherDescription})", Snackbar.LENGTH_LONG)
                        .setAction("Delete", View.OnClickListener {
                            historyModel?.let { it1 -> mapViewModel.deleteHistory(it1) }
                            p0.remove()
                        }).show()
                }
            }
        }
        return true
    }

    fun checkIn(){

        // Get weather for the checked-in location, push to the database
        var weather = weatherService.getWeather(lastLocation.latitude, lastLocation.longitude)
        var history: HistoryModel = HistoryModel(UUID.randomUUID(), 0.0, 0.0, "", Date(), 0.0, "")

        weather.observe(
            viewLifecycleOwner,
            androidx.lifecycle.Observer {
                    response -> response.let {
                history.lat = lastLocation.latitude
                history.lng = lastLocation.longitude
                history.address = getAddress(lastLocation)

                var main: Main = response.main!!
                history.temp = String.format("%.3f", main.temp).toDouble()

                var weather: Weather = response.weather[0]
                history.weatherDescription = weather.description.toString()

                mapViewModel.addHistory(history)
            }
            }
        )

    }

}