package com.csci448.alperenugus_a3.ui.History

import android.view.View
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.csci448.alperenugus_a3.R
import com.csci448.alperenugus_a3.data.HistoryModel

class HistoryHolder(val view: View): RecyclerView.ViewHolder(view) {
    lateinit var historyModel: HistoryModel

    val checkInTextView: TextView = itemView.findViewById(R.id.check_in_text_view)
    val latitudeTextView: TextView = itemView.findViewById(R.id.latitude_text_view)
    val longitudeTextView: TextView = itemView.findViewById(R.id.longitude_text_view)
    val temperatureTextView: TextView = itemView.findViewById(R.id.temperature_text_view)
    val weatherTextView: TextView = itemView.findViewById(R.id.weather_text_view)


    fun bind(historyModel: HistoryModel){
        this.historyModel = historyModel
        checkInTextView.text = historyModel.dateTime.toString()
        latitudeTextView.text = historyModel.lat.toString()
        longitudeTextView.text = historyModel.lng.toString()
        temperatureTextView.text = historyModel.temp.toString()
        weatherTextView.text = historyModel.weatherDescription
    }

    fun getObject(): HistoryModel {
        return historyModel
    }
}