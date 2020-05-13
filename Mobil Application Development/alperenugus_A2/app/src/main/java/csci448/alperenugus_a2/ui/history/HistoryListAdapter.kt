package csci448.alperenugus_a2.ui.history

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.paging.PagedListAdapter
import androidx.recyclerview.widget.DiffUtil
import csci448.alperenugus_a2.R
import csci448.alperenugus_a2.data.History


class HistoryListAdapter(private val historyList: List<History>, private val clickListener: (History) -> Unit): PagedListAdapter<History, HistoryListHolder>(DIFF_CALLBACK)  {

    companion object {
        private val DIFF_CALLBACK = object : DiffUtil.ItemCallback<History>() {
            override fun areItemsTheSame(oldItem: History, newItem: History) =
                oldItem.id == newItem.id
            override fun areContentsTheSame(oldItem: History, newItem: History) =
                oldItem == newItem
        }
    }

    override fun getItemCount(): Int {
        return historyList.size
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): HistoryListHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.history_list_item, parent, false)
        return HistoryListHolder(view)    }

    override fun onBindViewHolder(holder: HistoryListHolder, position: Int) {
        val history = historyList[position]
        holder.bind(history, clickListener)
    }


}