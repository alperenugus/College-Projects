package csci448.alperenugus_a2.ui.history

import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.*
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import csci448.alperenugus_a2.R
import csci448.alperenugus_a2.data.History

private val logTag: String = "448.HistoryFragment"

class HistoryFragment: Fragment() {

    private var callbacks: Callbacks? = null
    private lateinit var historyRecyclerView: RecyclerView
    private lateinit var adapter: HistoryListAdapter
    private lateinit var factory: HistoryListViewModelFactory
    private var player1WinCount: Int = 0
    private var player2WinCount: Int = 0
    private var computerWinCount: Int = 0
    private var tieCount: Int = 0
    private lateinit var scoreTextView: TextView


    private val historyListViewModel: HistoryListViewModel by lazy {
        ViewModelProvider(this@HistoryFragment, factory)
            .get(HistoryListViewModel::class.java)
    }

    // Tell the MainActivity to change the fragment
    interface Callbacks{
        fun onHistoryNewGameClicked()
        fun onHistoryPreferencesClicked()
        fun onHistoryQuitClicked()
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        Log.d(logTag, "onOptionsItemSelected called")
        return when(item?.itemId){
            R.id.history_menu_newgame -> {
                callbacks?.onHistoryNewGameClicked()
                true
            }

            R.id.history_menu_preferences -> {
                callbacks?.onHistoryPreferencesClicked()
                true
            }

            R.id.history_menu_delete_all -> {
                historyListViewModel.deleteAll()
                true
            }

            R.id.history_menu_quit -> {
                callbacks?.onHistoryQuitClicked()
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }

    // Put the menu to the fragment
    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        Log.d(logTag, "onCreateOptionsMenu called")
        super.onCreateOptionsMenu(menu, inflater)

        inflater?.inflate(R.menu.history_menu, menu)
    }

    override fun onAttach(context: Context) {
        Log.d(logTag, "onAttach called")
        super.onAttach(context)
        callbacks = context as Callbacks?
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        Log.d(logTag, "onCreate called")
        super.onCreate(savedInstanceState)
        // Enable the menu
        setHasOptionsMenu(true)
        factory = HistoryListViewModelFactory(requireContext())

    }

    fun updateUI(historyList : List<History>){
        adapter = HistoryListAdapter(historyList){
                history: History -> Unit
        }
        historyRecyclerView.adapter = adapter
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d(logTag, "onCreateView called")

        val view = inflater.inflate(R.layout.history, container, false)

        historyRecyclerView = view.findViewById(R.id.history_list_recycler_view) as RecyclerView

        historyRecyclerView.layoutManager = LinearLayoutManager(context)

        scoreTextView = view.findViewById(R.id.history_score_text_view)

        updateUI(emptyList())

        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        Log.d(logTag, "onViewCreated called")
        super.onViewCreated(view, savedInstanceState)

        historyListViewModel.historyListLiveData.observe(
            viewLifecycleOwner,
            Observer {historyList ->
                historyList.let {
                    Log.d(logTag, "Got historyList ${historyList.size}")
                    updateUI(historyList)

                    for(history in historyList){
                        if (history.winner == "Player 1") player1WinCount++
                        else if (history.winner == "Player 2") player2WinCount++
                        else if (history.winner == "Computer") computerWinCount++
                        else tieCount++
                        }

                    scoreTextView.text = "Scores: Player1: " +
                            player1WinCount.toString() + " Player2: " + player2WinCount.toString() + " Computer: " + computerWinCount.toString()

                    if(historyList.size == 0) scoreTextView.text = "There are no history records!"

                    }
            }

        )


    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        Log.d(logTag, "onActivityCreated called")
        super.onActivityCreated(savedInstanceState)
    }

    override fun onStart() {
        Log.d(logTag, "onStart called")
        super.onStart()
    }

    override fun onResume() {
        Log.d(logTag, "onResume called")
        super.onResume()
    }

    override fun onPause() {
        Log.d(logTag, "onPause called")
        super.onPause()
    }

    override fun onStop() {
        Log.d(logTag, "onStop called")
        super.onStop()
    }

    override fun onDestroyView() {
        Log.d(logTag, "onDestroyView called")
        super.onDestroyView()
    }

    override fun onDestroy() {
        Log.d(logTag, "onDestroy called")
        super.onDestroy()
    }

    override fun onDetach() {
        Log.d(logTag, "onDetach called")
        super.onDetach()
        callbacks = null
    }
}