package csci448.alperenugus_a2.ui.history

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import csci448.alperenugus_a2.data.HistoryRepository

class HistoryListViewModelFactory(private val context: Context): ViewModelProvider.Factory {

    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return modelClass.getConstructor(HistoryRepository::class.java)
            .newInstance(HistoryRepository.getInstance(context))}

}