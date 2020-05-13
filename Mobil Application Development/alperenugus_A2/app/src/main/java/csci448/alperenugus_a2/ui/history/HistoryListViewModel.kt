package csci448.alperenugus_a2.ui.history

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import androidx.paging.PagedList
import csci448.alperenugus_a2.data.History
import csci448.alperenugus_a2.data.HistoryRepository

class HistoryListViewModel(private val historyRepository: HistoryRepository): ViewModel() {

    val historyListLiveData: LiveData<PagedList<History>> = historyRepository.getHistory()

    fun deleteAll(){
        historyRepository.deleteAll()
    }


}