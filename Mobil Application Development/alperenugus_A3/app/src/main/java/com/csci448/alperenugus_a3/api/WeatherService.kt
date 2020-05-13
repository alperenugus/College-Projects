package com.csci448.alperenugus_a3.api

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

private const val logTag: String = "WeatherService"
private const val apiKey: String = "57588860a009d49e9989af5b98f8d8f5"

class WeatherService {

    private var weatherApi: WeatherApi
    private var forecastApi: ForecastApi

    init {
        val retrofit: Retrofit = Retrofit.Builder()
            .baseUrl("http://api.openweathermap.org/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        weatherApi = retrofit.create(WeatherApi::class.java)
        forecastApi = retrofit.create(ForecastApi::class.java)
    }

    // Current weather data
    fun getWeather(lat: Double, lng: Double): LiveData<WeatherResponse> {
        val responseLiveData: MutableLiveData<WeatherResponse> = MutableLiveData()

        val weatherRequest: Call<WeatherResponse> = weatherApi.getCurrentWeatherData(lat.toString(), lng.toString(), apiKey)

        weatherRequest.enqueue(object: Callback<WeatherResponse>{
            override fun onFailure(call: Call<WeatherResponse>, t: Throwable) {
                Log.d(logTag, "There was a problem.")
                Log.d(logTag, t.message)
            }

            override fun onResponse(
                call: Call<WeatherResponse>,
                response: Response<WeatherResponse>
            ) {
                responseLiveData.value = response.body()
                Log.d(logTag, "Got the response ${response.body().toString()}")
                Log.d(logTag, response.code().toString())
            }

        })
        return responseLiveData
    }

    // Forecast data for a while
    fun getForecast(lat: Double, lng: Double): LiveData<List<WeatherResponse>> {
        Log.d(logTag, "GetForecast")
        val responseLiveData: MutableLiveData<List<WeatherResponse>> = MutableLiveData()

        val forecastRequest: Call<ForecastResponse> = forecastApi.getCurrentWeatherData(lat.toString(), lng.toString(), apiKey)

        forecastRequest.enqueue(object: Callback<ForecastResponse>{
            override fun onFailure(call: Call<ForecastResponse>, t: Throwable) {
                Log.d(logTag, "There was a problem.")
                Log.d(logTag, t.message)
            }

            override fun onResponse(
                call: Call<ForecastResponse>,
                response: Response<ForecastResponse>
            ) {
                responseLiveData.value = response.body()?.list
                Log.d(logTag, "Got the response ${response.body().toString()}")
                Log.d(logTag, response.code().toString())
            }

        })
        return responseLiveData
    }

}