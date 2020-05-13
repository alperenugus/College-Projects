package csci448.alperenugus_a2.data

import androidx.lifecycle.LiveData
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import androidx.paging.DataSource

@Dao
interface HistoryDao {

    @Query("SELECT * FROM history")
    fun getHistory(): DataSource.Factory<Int, History>

    @Insert
    fun addHistory(history: History)

    @Query("DELETE FROM history")
    fun deleteAll()

}