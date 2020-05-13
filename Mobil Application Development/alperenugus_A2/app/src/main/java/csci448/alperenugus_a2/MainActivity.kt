package csci448.alperenugus_a2

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import csci448.alperenugus_a2.ui.game.GameFragment
import csci448.alperenugus_a2.ui.history.HistoryFragment
import csci448.alperenugus_a2.ui.PreferencesFragment
import csci448.alperenugus_a2.ui.WelcomeFragment

private val logTag: String = "448.MainActivity"

private val SAVED_FRAGMENT_NAME = "SavedFragmentName"

class MainActivity : AppCompatActivity(), WelcomeFragment.Callbacks, HistoryFragment.Callbacks, GameFragment.Callbacks {

    private var savedFragment: String = "WelcomeFragment"

    override fun onNewGameClicked() {
        val fragment = GameFragment()
        supportFragmentManager.beginTransaction()
            .replace(R.id.fragment_container, fragment)
            .addToBackStack(null)
            .commit()
        savedFragment = "GameFragment"
    }

    override fun onHistoryClicked() {
        val fragment = HistoryFragment()
        supportFragmentManager.beginTransaction()
            .replace(R.id.fragment_container, fragment)
            .addToBackStack(null)
            .commit()
        savedFragment = "HistoryFragment"
    }

    override fun onPreferencesClicked() {
        val fragment = PreferencesFragment()
        supportFragmentManager.beginTransaction()
            .replace(R.id.fragment_container, fragment)
            .addToBackStack(null)
            .commit()
        savedFragment = "PreferencesFragment"
    }

    override fun onQuitClicked() {
        finishAndRemoveTask()
    }

    override fun onHistoryNewGameClicked() {
        val fragment = GameFragment()
        supportFragmentManager.beginTransaction()
            .replace(R.id.fragment_container, fragment)
            .addToBackStack(null)
            .commit()
        savedFragment = "GameFragment"
    }

    override fun onHistoryPreferencesClicked() {
        val fragment = PreferencesFragment()
        supportFragmentManager.beginTransaction()
            .replace(R.id.fragment_container, fragment)
            .addToBackStack(null)
            .commit()
        savedFragment = "PreferencesFragment"
    }

    override fun onHistoryQuitClicked() {
        finishAndRemoveTask()
    }

    override fun onGameReturnClicked() {
        val fragment = WelcomeFragment()
        supportFragmentManager.beginTransaction()
            .replace(R.id.fragment_container, fragment)
            .addToBackStack(null)
            .commit()
        savedFragment = "WelcomeFragment"
    }

    override fun onGamePlayAgainClicked() {

        val fragment = GameFragment()
        supportFragmentManager.beginTransaction()
            .replace(R.id.fragment_container, fragment)
            .addToBackStack(null)
            .commit()
        savedFragment = "WelcomeFragment"    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Check if there already is a fragment
        val currentFragment: Fragment? = supportFragmentManager.findFragmentById(R.id.fragment_container)

        if(currentFragment == null){

            val welcomeFragment: Fragment = WelcomeFragment()

            supportFragmentManager.beginTransaction()
                .add(R.id.fragment_container, welcomeFragment)
                .commit()

        }

    }
}
