package csci448.alperenugus_a2.ui.game

import androidx.lifecycle.ViewModel
import csci448.alperenugus_a2.data.History
import csci448.alperenugus_a2.data.HistoryRepository

class GameFragmentViewModel(private val historyRepository: HistoryRepository): ViewModel() {

    fun addRecord(history: History){
        historyRepository.addHistory(history)
    }

}