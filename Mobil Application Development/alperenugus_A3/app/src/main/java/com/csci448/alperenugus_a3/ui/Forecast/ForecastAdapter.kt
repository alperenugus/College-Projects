package com.csci448.alperenugus_a3.ui.Forecast

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.csci448.alperenugus_a3.R
import com.csci448.alperenugus_a3.api.WeatherResponse

class ForecastAdapter(private val weatherResponse: List<WeatherResponse>):
    RecyclerView.Adapter<ForecastHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ForecastHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.list_item_forecast, parent, false)
        return ForecastHolder(view)
    }

    override fun getItemCount(): Int {
        return weatherResponse.size
    }

    override fun onBindViewHolder(holder: ForecastHolder, position: Int) {
        val forecast = weatherResponse[position]
        holder.bind(forecast)
    }


}