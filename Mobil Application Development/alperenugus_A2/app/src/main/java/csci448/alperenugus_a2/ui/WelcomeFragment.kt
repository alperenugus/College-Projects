package csci448.alperenugus_a2.ui

import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.*
import androidx.fragment.app.Fragment
import csci448.alperenugus_a2.R

private val logTag: String = "448.WelcomeFragment"

class WelcomeFragment: Fragment() {

    // Tell the MainActivity to change the fragment
    interface Callbacks{
        fun onNewGameClicked()
        fun onHistoryClicked()
        fun onPreferencesClicked()
        fun onQuitClicked()
    }

    private var callbacks: Callbacks? = null

    // Put the menu to the fragment
    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        super.onCreateOptionsMenu(menu, inflater)
        Log.d(logTag, "onCreateOptionsMenu called")

        inflater?.inflate(R.menu.welcome_menu, menu)
    }

    // IMPLEMENT THIS
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        Log.d(logTag, "onOptionsItemSelected called")

        return when(item?.itemId){
            R.id.welcome_menu_newgame -> {
                callbacks?.onNewGameClicked()
                true
            }

            R.id.welcome_menu_history -> {
                callbacks?.onHistoryClicked()
                true
            }

            R.id.welcome_menu_preferences -> {
                callbacks?.onPreferencesClicked()
                true
            }

            R.id.welcome_menu_quit -> {
                callbacks?.onQuitClicked()
                true
            }
            else -> super.onOptionsItemSelected(item)
        }

        return super.onOptionsItemSelected(item)
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
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d(logTag, "onCreateView called")

        val view = inflater.inflate(R.layout.welcome, container, false)
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        Log.d(logTag, "onViewCreated called")
        super.onViewCreated(view, savedInstanceState)
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
    }





}