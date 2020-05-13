package com.csci448.alperenugus_a3.data

import android.content.Context
import android.util.Log
import androidx.lifecycle.LiveData
import java.util.concurrent.Executors

private const val logTag: String = "HistoryRepository"

class HistoryRepository(private val historyDao: HistoryDao) {

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
            throw IllegalStateException("HistoryRepository must be initialized")
        }
    }

    fun getHistory(): LiveData<List<HistoryModel>> {
        return historyDao.getHistory()
    }

    fun addHistory(historyModel: HistoryModel){
        executor.execute {
            historyDao.addHistory(historyModel)
            Log.d(logTag, "Added ${historyModel.toString()}")
        }
    }

    fun deleteHistory(historyModel: HistoryModel){
        executor.execute{
            historyDao.deleteHistory(historyModel)
        }
    }

    fun deleteAll(){
        executor.execute{
            historyDao.deleteAll()
        }
    }


}