package csci448.alperenugus_a2.data

import android.content.Context
import androidx.lifecycle.LiveData
import androidx.paging.LivePagedListBuilder
import androidx.paging.PagedList
import java.util.concurrent.Executors

class HistoryRepository (private val historyDao: HistoryDao) {

    private val executor = Executors.newSingleThreadExecutor()

    companion object {
        private var instance: HistoryRepository? = null
        fun getInstance(context: Context): HistoryRepository? {
            return instance ?: let {
                if (instance == null) {
                    val database = HistoryDatabase.getInstance(context)
                    instance = HistoryRepository(database.historyDao())
                }
                return instance
            }
        }

        fun get(): HistoryRepository {
            return instance ?:
            throw IllegalStateException("CrimeRepository must be initialized")
        }
    }

    fun getHistory(): LiveData<PagedList<History>> {
        return LivePagedListBuilder(
            historyDao.getHistory(),
            PagedList.Config.Builder()
                .setPageSize(125)
                .setPrefetchDistance(50)
                .setMaxSize(400)
                .build()
        ).build()
    }

    fun addHistory(history: History){
        executor.execute {
            historyDao.addHistory(history)
        }
    }

    fun deleteAll(){
        executor.execute{
            historyDao.deleteAll()
        }
    }




}