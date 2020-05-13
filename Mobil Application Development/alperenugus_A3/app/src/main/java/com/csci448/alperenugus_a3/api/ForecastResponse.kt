package com.csci448.alperenugus_a3.api

import com.google.gson.annotations.SerializedName

class ForecastResponse {
    @SerializedName("cod")
    val cod : Int? = null

    @SerializedName("message")
    val message : Double? = null

    @SerializedName("cnt")
    val cnt : Int? = null

    @SerializedName("list")
    val list : List<WeatherResponse>? = null

}

