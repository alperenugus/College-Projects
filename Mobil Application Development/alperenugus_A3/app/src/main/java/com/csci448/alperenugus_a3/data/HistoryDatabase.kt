package com.csci448.alperenugus_a3.data

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters

private const val DATABASE_NAME = "history-database"

@Database(entities = [HistoryModel::class], version = 1)
@TypeConverters(HistoryTypeConverters::class)
abstract class HistoryDatabase: RoomDatabase() {

    companion object {
        private var instance: HistoryDatabase? = null

        fun getInstance(context: Context): HistoryDatabase {
            return instance ?: let {
                instance ?: Room.databaseBuilder(
                    context,
                    HistoryDatabase::class.java,
                    DATABASE_NAME
                ).build()
            }
        }
    }

    abstract fun historyDao(): HistoryDao

}