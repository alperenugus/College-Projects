package csci448.alperenugus_a2.ui.history

import android.view.View
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import csci448.alperenugus_a2.R
import csci448.alperenugus_a2.data.History

class HistoryListHolder(val view: View): RecyclerView.ViewHolder(view) {

    lateinit var history: History
    val dateTextView: TextView = itemView.findViewById(R.id.history_date)
    val winnerTextView: TextView = itemView.findViewById(R.id.history_winner)
    val pieceTextView: TextView = itemView.findViewById(R.id.history_piece)

    fun bind(history: History, clickListener: (History) -> Unit){
        this.history = history
        itemView.setOnClickListener { clickListener(this.history) }

        dateTextView.text = this.history.date.toString()
        winnerTextView.text = this.history.winner
        pieceTextView.text = this.history.piece

    }
}