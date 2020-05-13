package com.csci448.alperenugus_a3.data

import androidx.lifecycle.LiveData
import androidx.room.*
import java.util.*

@Dao
interface HistoryDao{

    @Query("SELECT * FROM historymodel")
    fun getHistory(): LiveData<List<HistoryModel>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun addHistory(historyModel: HistoryModel)

    @Delete
    fun deleteHistory(historyModel: HistoryModel)

    @Query("DELETE FROM historymodel")
    fun deleteAll()
}