package theinvestors.csci448.geolocatr

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.IntentSender
import android.content.pm.PackageManager.PERMISSION_GRANTED
import android.location.Geocoder
import android.location.Location
import android.os.Bundle
import android.util.Log
import android.view.*
import android.widget.TextView
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.fragment.app.Fragment
import androidx.work.*
import com.google.android.gms.common.api.ResolvableApiException
import com.google.android.gms.location.*
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.LatLngBounds
import com.google.android.gms.maps.model.MarkerOptions
import java.io.IOException
import java.util.concurrent.TimeUnit
import kotlin.text.StringBuilder

private const val logTag = "LocatrFragment"

private const val FINE_LOCATION_PERMISSION =
    android.Manifest.permission.ACCESS_FINE_LOCATION
private const val REQUEST_LOC_PERMISSION = 1

private const val PERIODIC_POLL_NAME = "PeriodicPollName"

private const val UNKNOWN_POSITION = -999.0

private const val ARGS_LATITUDE = "lat"
private const val ARGS_LONGITUDE = "lng"


class LocatrFragment: SupportMapFragment() {

    private lateinit var locationRequest: LocationRequest
    private lateinit var fusedLocationProviderClient:
            FusedLocationProviderClient
    private lateinit var locationCallback: LocationCallback

    private lateinit var googleMap: GoogleMap
    private lateinit var lastLocation: Location

    private lateinit var workManager: WorkManager


    companion object{
        const val REQUEST_LOC_ON = 0
        //var locationUpdateState = false
        private var locationUpdateState = false

//        fun newInstance(lat: Double, lng: Double): LocatrFragment {
//            var locatrFragment: LocatrFragment = LocatrFragment()
//            var args: Bundle = Bundle()
//            args.putDouble("lat", lat)
//            args.putDouble("lng", lng)
//            locatrFragment.arguments = args
//            return locatrFragment
//        }

    }

    override fun onAttach(context: Context) {
        Log.d(logTag, "onAttach() called")
        super.onAttach(context)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        Log.d(logTag, "onCreate() called")
        super.onCreate(savedInstanceState)

        workManager = WorkManager.getInstance(requireContext())

        locationRequest = LocationRequest.create()
        locationRequest.interval = 0
        locationRequest.numUpdates = 1
        locationRequest.priority = LocationRequest.PRIORITY_HIGH_ACCURACY
        fusedLocationProviderClient =
            LocationServices.getFusedLocationProviderClient(requireContext())

        locationCallback = object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult) {
                super.onLocationResult(locationResult)
                Log.d(logTag, "Got a location: ${locationResult.lastLocation}")
                lastLocation = locationResult.lastLocation
                updateUI()
            }
        }

        setHasOptionsMenu(true)

        val latitude = arguments?.getDouble(ARGS_LATITUDE, UNKNOWN_POSITION)
            ?: UNKNOWN_POSITION
        val longitude = arguments?.getDouble(ARGS_LONGITUDE, UNKNOWN_POSITION)
            ?: UNKNOWN_POSITION
        if(latitude != UNKNOWN_POSITION && longitude != UNKNOWN_POSITION) {
            // we have an actual location
            Log.d(logTag, "Hello")
            lastLocation = Location("") // we need to provide a location provider, which is ignored
            lastLocation.latitude = latitude
            lastLocation.longitude = longitude
        }

        getMapAsync { map ->
            googleMap = map
            requireActivity().invalidateOptionsMenu()
            googleMap.setOnMapLoadedCallback {
                updateUI()
            }
        }
    }

    override fun onCreateView(inflater: LayoutInflater,
                              container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        Log.d(logTag, "onCreateView() called")
        val mapView = super.onCreateView(inflater,
            container,
            savedInstanceState)
        return mapView
    }

    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        Log.d(logTag, "onCreateOptionsMenu() called")
        super.onCreateOptionsMenu(menu, inflater)
        inflater.inflate(R.menu.fragment_locatr, menu)

        Log.d(logTag, "LocationUpdateState = $locationUpdateState")

        // Check if we are able to get location and enable/disable the menu item
        val locationItem = menu?.findItem(R.id.get_location_menu_item)
        locationItem?.isEnabled = (locationUpdateState
                && ::googleMap.isInitialized)
        Log.d(logTag, "locationItem?.isEnabled = ${locationItem?.isEnabled}")

        val pollingItem = menu.findItem(R.id.polling_menu_item)
        pollingItem.title =
            if( LocatrApplication.locatrSharedPreferences.isPollingOn ) {
                getString( R.string.end_polling_label )
            } else {
                getString( R.string.start_polling_label )
            }
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        Log.d(logTag, "onOptionsItemSelected() called")
        return when (item.itemId) {
            R.id.get_location_menu_item -> {
                Log.d(logTag, "get_location_menu_item clicked")
                checkPermissionAndGetLocation()
                true
            }

            R.id.polling_menu_item -> {
                Log.d(logTag, "polling_menu_item clicked")
                LocatrApplication.locatrSharedPreferences.isPollingOn =
                    !LocatrApplication.locatrSharedPreferences.isPollingOn
                requireActivity().invalidateOptionsMenu()

                if(LocatrApplication.locatrSharedPreferences.isPollingOn){
                    val constraints = Constraints.Builder()
                        .setRequiredNetworkType(NetworkType.CONNECTED)
                        .setRequiresBatteryNotLow(true)
                        .build()
                    val periodicWorkRequest =
                        PeriodicWorkRequestBuilder<LocatrWorker>(1, TimeUnit.MINUTES)
                            .setConstraints(constraints)
                            .build()

                    workManager.enqueueUniquePeriodicWork(PERIODIC_POLL_NAME,
                        ExistingPeriodicWorkPolicy.KEEP,
                        periodicWorkRequest
                    )
                }
                else{
                    workManager.cancelUniqueWork(PERIODIC_POLL_NAME)
                }

                true
            }
            else -> super.onOptionsItemSelected(item)
        }

    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        Log.d(logTag, "onViewCreated() called")
        super.onViewCreated(view, savedInstanceState)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        Log.d(logTag, "onActivityCreated() called")
        super.onActivityCreated(savedInstanceState)
    }

    override fun onStart() {
        Log.d(logTag, "onStart() called")
        super.onStart()
        checkIfLocationCanBeRetrieved()
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

    private fun checkIfLocationCanBeRetrieved() {
        val builder = LocationSettingsRequest.Builder()
            .addLocationRequest(locationRequest)
        val client = LocationServices.getSettingsClient(requireActivity())
        val task = client.checkLocationSettings(builder.build())
        task.addOnSuccessListener {
            locationUpdateState = true
            requireActivity().invalidateOptionsMenu()
        }
        task.addOnFailureListener {exc ->
            locationUpdateState = false
            requireActivity().invalidateOptionsMenu()
            if(exc is ResolvableApiException) {
                try {
                    exc.startResolutionForResult(requireActivity(), REQUEST_LOC_ON)
                } catch (e: IntentSender.SendIntentException) {
                    // do nothing, they cancelled so ignore error
                }
            }
        }
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
            requireActivity().invalidateOptionsMenu()
        }
    }

    private fun checkPermissionAndGetLocation(){
        Log.d(logTag, "checkPermissionAndGetLocation() called")

        if(ContextCompat.checkSelfPermission(requireActivity(),
                FINE_LOCATION_PERMISSION )!= PERMISSION_GRANTED){

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
            //Toast.makeText(requireContext(), R.string.thanks, Toast.LENGTH_SHORT).show();
            fusedLocationProviderClient.requestLocationUpdates(locationRequest,
                locationCallback, null)
            Log.d(logTag, "Thank you!")

        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {

        if(requestCode == REQUEST_LOC_PERMISSION){
            if(permissions.isNotEmpty() && permissions[0] == FINE_LOCATION_PERMISSION
                && grantResults.isNotEmpty() && grantResults[0] == PERMISSION_GRANTED){
                checkPermissionAndGetLocation()
            }
            else{
                super.onRequestPermissionsResult(requestCode, permissions, grantResults)
            }
        }
    }

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

        if(getAddress(lastLocation) == ""){
            myMarker.title("Lat: ${lastLocation.latitude} Lng: ${lastLocation.longitude}")
        }
        else{
            myMarker.title( getAddress(lastLocation))
        }

        Log.d(logTag, "Title: ${getAddress(lastLocation)}")
        // clear any prior markers on the map
        googleMap.clear()
        // add the new markers
        googleMap.addMarker(myMarker)
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



}