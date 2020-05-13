package com.csci448.alperenugus_a3.ui.Map

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.csci448.alperenugus_a3.data.HistoryModel
import com.csci448.alperenugus_a3.data.HistoryRepository
import com.google.android.gms.maps.model.LatLng

class MapViewModel(private val historyRepository: HistoryRepository) : ViewModel()  {

    val history: LiveData<List<HistoryModel>> = historyRepository.getHistory()

    fun addHistory(historyModel: HistoryModel){
        historyRepository.addHistory(historyModel)
    }

    fun deleteHistory(historyModel: HistoryModel){
        historyRepository.deleteHistory(historyModel)
    }
}