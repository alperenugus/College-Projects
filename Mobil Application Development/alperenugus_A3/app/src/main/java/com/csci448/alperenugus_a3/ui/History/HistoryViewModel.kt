package com.csci448.alperenugus_a3.ui.History

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.csci448.alperenugus_a3.data.HistoryModel
import com.csci448.alperenugus_a3.data.HistoryRepository

class HistoryViewModel(private val historyRepository: HistoryRepository) : ViewModel() {

    val history: LiveData<List<HistoryModel>> = historyRepository.getHistory()

    fun deleteHistory(historyModel: HistoryModel){
        historyRepository.deleteHistory(historyModel)
    }

}