package alperenugus.csci448.kotlinquiz

import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.TextView


private const val LOG_TAG = "448.CheatActivity"
private const val EXTRA_ANSWER_IS_TRUE = "CORRECT_ANSWER_KEY"
private const val EXTRA_IS_CHEATED = "IS_CHEATED_KEY"
private const val STATUS_OK = 0

class CheatActivity : AppCompatActivity() {

    lateinit var showAnswerButton: Button
    lateinit var answerText: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_cheat)
        showAnswerButton = findViewById(R.id.show_answer_button)
        answerText = findViewById(R.id.answer_text)

        var isAnswerTrue = intent.getBooleanExtra(EXTRA_ANSWER_IS_TRUE, false)

        showAnswerButton.setOnClickListener {
            answerText.text = isAnswerTrue.toString()
            answerText.visibility = View.VISIBLE
            setCheated()
        }

    }

    override fun onStart() {
        super.onStart()
        Log.d(LOG_TAG, "onStart() called")
    }

    override fun onResume() {
        super.onResume()
        Log.d(LOG_TAG, "onResume() called")

    }

    override fun onPause() {
        Log.d(LOG_TAG, "onPause() called")
        super.onPause()
    }

    override fun onStop() {
        Log.d(LOG_TAG, "onStop() called")
        super.onStop()
    }

    override fun onDestroy() {
        Log.d(LOG_TAG, "onDestroy() called")
        super.onDestroy()
    }

    //Public methods visible to other activities.
    companion object Factory{
        fun createIntent(context: Context, answer: Boolean) : Intent{
            val intent = Intent(context, CheatActivity::class.java)
            intent.putExtra(EXTRA_ANSWER_IS_TRUE, answer)
            return intent
        }

        fun didUserCheat(intent: Intent) : Boolean{
            return intent.getBooleanExtra(EXTRA_IS_CHEATED, false)
        }
    }

    // Setting activityResult with respect to cheating behavior.
    fun setCheated(){
        val intent = Intent()
        intent.apply {
            intent.putExtra(EXTRA_IS_CHEATED, true)
            setResult(STATUS_OK, intent)
        }
    }

}
