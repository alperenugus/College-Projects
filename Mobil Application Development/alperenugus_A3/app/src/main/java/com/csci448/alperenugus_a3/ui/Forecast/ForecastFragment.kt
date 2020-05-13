package com.csci448.alperenugus_a3.ui.Forecast

import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.*
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.LiveData
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.csci448.alperenugus_a3.MainActivity
import com.csci448.alperenugus_a3.R
import com.csci448.alperenugus_a3.api.ForecastResponse
import com.csci448.alperenugus_a3.api.WeatherResponse
import com.csci448.alperenugus_a3.api.WeatherService
import java.util.*

private const val logTag: String = "ForecastFragment"

class ForecastFragment: Fragment() {

    private lateinit var forecastRecyclerView: RecyclerView
    private lateinit var adapter: ForecastAdapter
    private var forecastService: WeatherService = WeatherService()
    private lateinit var refreshButton: Button
    private lateinit var forecastData: LiveData<List<WeatherResponse>>
    private lateinit var locationTextView: TextView
    private lateinit var updateTextView: TextView


    override fun onAttach(context: Context) {
        Log.d(logTag, "onAttach() called")
        super.onAttach(context)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        Log.d(logTag, "onCreate() called")
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d(logTag, "onCreateView() called")

        val view = inflater.inflate(R.layout.fragment_forecast, container, false)

        forecastRecyclerView = view.findViewById(R.id.forecast_recycler_view)
        forecastRecyclerView.layoutManager = LinearLayoutManager(context)

        refreshButton = view.findViewById(R.id.refresh_button)

        refreshButton.setOnClickListener {
            Log.d(logTag, "refreshButton clicked")
            loadForecast()
        }

        locationTextView = view.findViewById(R.id.forecast_current_location)
        updateTextView = view.findViewById(R.id.forecast_last_updated)

        updateUI(emptyList())

        return view    }

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

    fun updateUI(weatherResponse: List<WeatherResponse>){
        adapter = ForecastAdapter(weatherResponse)
        forecastRecyclerView.adapter = adapter
    }

    // Get the location for the last checked-in location
    fun loadForecast(){

        Log.d(logTag, "Lat: ${MainActivity.sharedLocation.latitude} Lng: ${MainActivity.sharedLocation.longitude} ")

        if(MainActivity.sharedLocation.latitude == MainActivity.garbage && MainActivity.sharedLocation.longitude == MainActivity.garbage){
            Toast.makeText(requireContext(), R.string.location_not_set, Toast.LENGTH_SHORT).show()
            return
        }

        // Get forecast data using the api
        forecastData = forecastService.getForecast(MainActivity.sharedLocation.latitude, MainActivity.sharedLocation.longitude)

        forecastData.observe(
            viewLifecycleOwner,
            Observer { result -> result.let {
                Log.d(logTag, "Got forecastData: ${result.toString()}")
                locationTextView.text = "Lat/Lng: ${MainActivity.sharedLocation.latitude} , ${MainActivity.sharedLocation.longitude}"
                updateTextView.text = Date().toString()
                updateUI(result)

            } }
        )
    }
}