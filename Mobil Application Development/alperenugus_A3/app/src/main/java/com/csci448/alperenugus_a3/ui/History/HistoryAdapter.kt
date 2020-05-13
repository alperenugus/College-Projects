package com.csci448.alperenugus_a3.ui.History

import android.util.Log
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.csci448.alperenugus_a3.R
import com.csci448.alperenugus_a3.data.HistoryModel

class HistoryAdapter(private val history: List<HistoryModel>):
    RecyclerView.Adapter<HistoryHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): HistoryHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.list_item_history, parent, false)
        return HistoryHolder(view)
    }

    override fun getItemCount(): Int {
        return history.size
    }

    override fun onBindViewHolder(holder: HistoryHolder, position: Int) {
        val historyModel = history[position]
        holder.bind(historyModel)
    }

    fun getHistoryAt(position: Int): HistoryModel {
        return history[position]
    }
}