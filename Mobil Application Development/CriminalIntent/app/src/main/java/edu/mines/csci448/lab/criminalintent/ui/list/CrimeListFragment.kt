package edu.mines.csci448.lab.criminalintent.ui.list

import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.*
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import edu.mines.csci448.lab.criminalintent.R
import edu.mines.csci448.lab.criminalintent.data.Crime
import java.util.*

class CrimeListFragment: Fragment() {

    private val logTag = "448.CrimeListFrag"


    //Required interface for hosting activities
    interface Callbacks{
        fun onCrimeSelected(crimeId: UUID)
    }

    private var callbacks: Callbacks? = null

    private lateinit var crimeRecyclerView: RecyclerView
    private lateinit var adapter: CrimeListAdapter

    // Get the View Model using the factory
    // Note that it is initialized in onCreate() method
    private lateinit var factory: CrimeListViewModelFactory

    //val factory = CrimeListViewModelFactory(requireContext())
    private val crimeListViewModel: CrimeListViewModel by lazy {
        ViewModelProvider(this@CrimeListFragment, factory)
            .get(CrimeListViewModel::class.java)
    }


    // Add crime
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        Log.d(logTag, "onOptionsItemSelected() called")
        return when(item.itemId) {
            R.id.new_crime_menu_item -> {
                val crime = Crime()
                crimeListViewModel.addCrime(crime)
                callbacks?.onCrimeSelected(crime.id)
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }

    // Menu Attachment to the fragment
    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        super.onCreateOptionsMenu(menu, inflater)

        Log.d(logTag, "onCreateOptionsMenu() called")
        // Attach menu layout to menu
        inflater.inflate(R.menu.fragment_crime_list, menu)
    }

    fun updateUI(crimes : List<Crime>){
        adapter = CrimeListAdapter(crimes){
            crime: Crime -> Unit
//            Toast.makeText(context,
//                "${crime.title} pressed!",
//            Toast.LENGTH_SHORT)
//            .show()

            // Send selected crime to MainActivity callBack in order to show the details of the clicked crime
            callbacks?.onCrimeSelected(crime.id)
        }
        crimeRecyclerView.adapter = adapter
    }


    override fun onAttach(context: Context){
        super.onAttach(context)
        Log.d(logTag, "onAttach() called")
        callbacks = context as Callbacks?
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d(logTag, "onCreate() called")

        // Enable the menu
        setHasOptionsMenu(true)

        factory = CrimeListViewModelFactory(requireContext())
    }

    override fun onCreateView(
    inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d(logTag, "onCreateView() called")

        val view = inflater.inflate(R.layout.fragment_list, container, false)

        crimeRecyclerView = view.findViewById(R.id.crime_list_recycler_view) as RecyclerView

        crimeRecyclerView.layoutManager = LinearLayoutManager(context)

        updateUI(emptyList())

        return view

    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        Log.d(logTag, "onViewCreated() called")

        crimeListViewModel.crimeListLiveData.observe(
            viewLifecycleOwner,
            Observer { crimes ->
                crimes?.let {
                    Log.i(logTag, "Got crimes ${crimes.size}")
                    updateUI(crimes)
                }
            })
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        Log.d(logTag, "onActivityCreated() called")
    }

    override fun onStart() {
        super.onStart()
        Log.d(logTag, "onStart() called")
    }

    override fun onResume() {
        super.onResume()
        Log.d(logTag, "onResume() called")
    }

    override fun onPause() {
        super.onPause()
        Log.d(logTag, "onPause() called")
    }

    override fun onStop() {
        super.onStop()
        Log.d(logTag, "onStop() called")
    }

    override fun onDestroyView() {
        super.onDestroyView()
        Log.d(logTag, "onDestroyView() called")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d(logTag, "onDestroy() called")
    }

    override fun onDetach() {
        super.onDetach()
        Log.d(logTag, "onDetach() called")
        // Unbind the callback from the MainActivity context
        callbacks = null
    }

}