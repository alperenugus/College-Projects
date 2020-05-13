package com.csci448.alperenugus_a3.data

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.*

@Entity
data class HistoryModel(
    @PrimaryKey
    val id: UUID = UUID.randomUUID(),
    var lat: Double,
    var lng: Double,
    var address: String,
    var dateTime: Date,
    var temp: Double,
    var weatherDescription: String
)