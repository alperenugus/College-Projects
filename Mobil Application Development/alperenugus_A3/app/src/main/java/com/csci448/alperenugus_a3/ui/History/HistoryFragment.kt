package com.csci448.alperenugus_a3.ui.History

import android.content.ClipData
import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.*
import android.widget.SimpleAdapter
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.ItemTouchHelper
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.csci448.alperenugus_a3.R
import com.csci448.alperenugus_a3.data.HistoryModel

private const val logTag: String = "HistoryFragment"

class HistoryFragment: Fragment() {

    private lateinit var factory: HistoryViewModelFactory
    private lateinit var historyRecyclerView: RecyclerView
    private lateinit var adapter: HistoryAdapter

    private val historyViewModel: HistoryViewModel by lazy {
        ViewModelProvider(this@HistoryFragment, factory)
            .get(HistoryViewModel::class.java)
    }


    override fun onAttach(context: Context) {
        Log.d(logTag, "onAttach() called")
        super.onAttach(context)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        Log.d(logTag, "onCreate() called")
        super.onCreate(savedInstanceState)
        factory = HistoryViewModelFactory(requireContext())

    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d(logTag, "onCreateView() called")

        val view = inflater.inflate(R.layout.fragment_history, container, false)

        historyRecyclerView = view.findViewById(R.id.history_recycler_view)
        historyRecyclerView.layoutManager = LinearLayoutManager(context)

        // Swipe-delete
        ItemTouchHelper(object:ItemTouchHelper.SimpleCallback(0,
            ItemTouchHelper.LEFT) {
            override fun onMove(
                recyclerView: RecyclerView,
                viewHolder: RecyclerView.ViewHolder,
                target: RecyclerView.ViewHolder
            ): Boolean {
                return true
            }

            override fun onSwiped(viewHolder: RecyclerView.ViewHolder, direction: Int) {
                historyViewModel.deleteHistory(adapter.getHistoryAt(viewHolder.adapterPosition))
            }

        }).attachToRecyclerView(historyRecyclerView)


        updateUI(emptyList())

        return view
    }

    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        Log.d(logTag, "onCreateOptionsMenu() called")
        super.onCreateOptionsMenu(menu, inflater)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        Log.d(logTag, "onOptionsItemSelected() called")
        return super.onOptionsItemSelected(item)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        Log.d(logTag, "onViewCreated() called")
        super.onViewCreated(view, savedInstanceState)

        historyViewModel.history.observe(
            viewLifecycleOwner,
            Observer { history -> history.let {
                Log.d(logTag, "History: ${history.toString()}")
                updateUI(history)
            }
            }
        )


    }

    override fun onActivityCreated(p0: Bundle?) {
        Log.d(logTag, "onActivityCreated() called")
        super.onActivityCreated(p0)
    }

    override fun onStart() {
        Log.d(logTag, "onStart() called")
        super.onStart()
    }

    override fun onResume() {
        Log.d(logTag, "onResume() called")
        super.onResume()
    }

    override fun onPause() {
        Log.d(logTag, "onPause() called")
        super.onPause()
    }

    override fun onDestroyView() {
        Log.d(logTag, "onDestroyView() called")
        super.onDestroyView()
    }

    override fun onDestroy() {
        Log.d(logTag, "onDestroy() called")
        super.onDestroy()
    }

    override fun onDetach() {
        Log.d(logTag, "onDetach() called")
        super.onDetach()
    }

    fun updateUI(history : List<HistoryModel>){
        adapter = HistoryAdapter(history)
        historyRecyclerView.adapter = adapter
    }

}