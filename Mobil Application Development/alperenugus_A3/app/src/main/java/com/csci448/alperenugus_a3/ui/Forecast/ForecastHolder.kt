package com.csci448.alperenugus_a3.ui.Forecast

import android.view.View
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.csci448.alperenugus_a3.R
import com.csci448.alperenugus_a3.api.Main
import com.csci448.alperenugus_a3.api.Weather
import com.csci448.alperenugus_a3.api.WeatherResponse
import java.util.*

class ForecastHolder(val view: View): RecyclerView.ViewHolder(view) {
    lateinit var weatherResponse: WeatherResponse

    val dateTextView: TextView = itemView.findViewById(R.id.forecast_date)
    val tempTextView: TextView = itemView.findViewById(R.id.forecast_temp)
    val descTextView: TextView = itemView.findViewById(R.id.forecast_desc)

    fun bind(weatherResponse: WeatherResponse){
        this.weatherResponse = weatherResponse

        dateTextView.text = toDate(weatherResponse.dt.toLong()).toString()

        var main: Main? = weatherResponse.main
        tempTextView.text = String.format("%.3f", main?.temp).toDouble().toString()

        var weather: Weather = weatherResponse.weather[0]
        descTextView.text = weather.description
    }

    fun toDate(millisSinceEpoch: Long?): Date? {
        return millisSinceEpoch?.let {
            Date(it)
        }
    }



}