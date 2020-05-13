package edu.mines.csci448.lab.criminalintent.ui.pager

import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.viewpager2.widget.ViewPager2
import edu.mines.csci448.lab.criminalintent.R
import edu.mines.csci448.lab.criminalintent.data.Crime
import java.util.*

private val logTag = "448.CrimePaperFragment"
private const val ARG_CRIME_PAGER_ID = "crime_id"


class CrimePagerFragment: Fragment() {

    private lateinit var crimeViewPager: ViewPager2
    private lateinit var factory: CrimePagerViewModelFactory
    private lateinit var adapter: CrimePagerAdapter
    private lateinit var crimeId: UUID


    //val factory = CrimeListViewModelFactory(requireContext())
    private val crimePagerViewModel: CrimePagerViewModel by lazy {
        ViewModelProvider(this@CrimePagerFragment, factory)
            .get(CrimePagerViewModel::class.java)
    }

    private fun updateUI(crimes: List<Crime>){
        adapter = CrimePagerAdapter(this, crimes)
        crimeViewPager.adapter = adapter

        crimes.forEachIndexed { position, crime ->
            if( crime.id == crimeId ) {
                crimeViewPager.currentItem = position
                return
            }
        }
    }

    companion object{
        fun newInstance(crimeId: UUID): CrimePagerFragment {

            val args = Bundle().apply {
                putSerializable(ARG_CRIME_PAGER_ID, crimeId)
            }

            return CrimePagerFragment().apply {
                arguments = args
            }

        }
    }

    override fun onAttach(context: Context) {
        super.onAttach(context)
        Log.d(logTag, "onAttach() called")
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d(logTag, "onCreate() called")

        factory = CrimePagerViewModelFactory(requireContext())

        crimeId = arguments?.getSerializable(ARG_CRIME_PAGER_ID) as UUID

    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        Log.d(logTag, "onActivityCreated() called")

    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d(logTag, "onCreateView() called")

        val view = inflater.inflate(R.layout.fragment_pager, container, false)
        crimeViewPager = view.findViewById(R.id.crime_view_pager)
        updateUI(emptyList())
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        Log.d(logTag, "onViewCreated() called")

        crimePagerViewModel.crimeListLiveData.observe(
            viewLifecycleOwner,
            Observer {crimes ->
                crimes?.let {
                    Log.d(logTag, "Got ${crimes.size} crimes")
                    updateUI(crimes)
                }

            }
        )

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

    override fun onDestroy() {
        super.onDestroy()
        Log.d(logTag, "onDestroy() called")

    }

    override fun onDetach() {
        super.onDetach()
        Log.d(logTag, "onDetach() called")

    }






}