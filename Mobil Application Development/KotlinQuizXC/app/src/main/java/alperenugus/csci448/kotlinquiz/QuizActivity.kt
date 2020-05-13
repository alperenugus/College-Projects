package alperenugus.csci448.kotlinquiz

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.TextView
import android.widget.Toast

private const val LOG_TAG = "448.QuizActivity"
private const val REQUEST_CODE_CHEAT = 0;
private const val STATUS_OK = 0
private const val SAVED_CHEATER_VALUE = "IS_CHEATER"




class QuizActivity : AppCompatActivity() {

    private lateinit var scoreTextView: TextView
    private lateinit var question_text_view: TextView
    private lateinit var trueButton: Button
    private lateinit var falseButton: Button
    private lateinit var nextButton: Button
    private lateinit var prevButton: Button
    private lateinit var cheatButton: Button
    private var isCheater: Boolean = false



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Prevent user to get score changing the orientation after seeing the true value by cheating
        if (savedInstanceState != null) {
            isCheater = savedInstanceState.getBoolean(SAVED_CHEATER_VALUE, false)
        }

        Log.d(LOG_TAG, "onCreate() called")

        setContentView(R.layout.activity_quiz)

        // Bind Views to the controller
        scoreTextView = findViewById( R.id.score_text_view )
        question_text_view = findViewById(R.id.question_text_view)
        trueButton = findViewById(R.id.true_button)
        falseButton = findViewById(R.id.false_button)
        nextButton = findViewById(R.id.next_button)
        prevButton = findViewById(R.id.prev_button)
        cheatButton = findViewById(R.id.cheat_button)

        // onClick Listeners for all buttons

        trueButton.setOnClickListener {
            checkAnswer(true)
        }

        falseButton.setOnClickListener {
            checkAnswer(false)
        }

        nextButton.setOnClickListener {
            moveToQuestion(1)
        }

        prevButton.setOnClickListener {
            moveToQuestion(-1)
        }

        cheatButton.setOnClickListener {
            launchCheat()
        }


        // Function that brings up the questions with respect to their orders
        updateQuestion()
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

    // Since we don't want user to cheat, change orientation and get score, we needed to save the state by overriding this method.
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putBoolean(SAVED_CHEATER_VALUE, isCheater)
    }

    fun updateQuestion(){
        setCurrentScoreText()
        question_text_view.text = resources.getString( QuizViewModel.currentQuestionTextId )
    }

    private fun setCurrentScoreText() {
        scoreTextView.text = QuizViewModel.currentScore.toString()
    }

    fun checkAnswer(answer:Boolean){
        // Check if the question is answered before.
        if(QuizViewModel.isAnswered()){
            Toast.makeText(baseContext, R.string.answered_toast, Toast.LENGTH_SHORT).show()
        }
        else{
            // If the user cheated now or before, he/she does not get score.
            if(isCheater || QuizViewModel.isCheated()){
                Toast.makeText(baseContext,
                    R.string.cheater_toast,
                    Toast.LENGTH_SHORT).show()
            }
            // Answer check: TRUE
            else if(QuizViewModel.isAnswerCorrect(answer, isCheater)){
                Toast.makeText(baseContext,
                    R.string.correct_toast,
                    Toast.LENGTH_SHORT).show()
            }
            // Answer check: FALSE
            else{
                Toast.makeText(baseContext,
                    R.string.incorrect_toast,
                    Toast.LENGTH_SHORT).show()
            }
        }
        setCurrentScoreText()
    }

    fun moveToQuestion(direction:Int){
        if(direction > 0) QuizViewModel.moveToNextQuestion()
        else QuizViewModel.moveToPreviousQuestion()
        // When we change the question, we reset the cheater flag.
        isCheater = false
        updateQuestion()
    }

    // Cheater activity launcher
    private fun launchCheat(){
        val intent:Intent = CheatActivity.createIntent(baseContext, QuizViewModel.getCurrentAnswer())
        startActivityForResult(intent, REQUEST_CODE_CHEAT)
    }

    // Cheater activity result check
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        Log.d(LOG_TAG, "onActivityResult() is called.")
        super.onActivityResult(requestCode, resultCode, data)

        if(resultCode == STATUS_OK && requestCode == REQUEST_CODE_CHEAT && data != null)
        {
            isCheater = CheatActivity.didUserCheat(data)
            if(isCheater){
                // Set question.isCheated flag to true.
                QuizViewModel.setCheated()
            }
            Log.d(LOG_TAG, isCheater.toString())
        }
        else{
            isCheater = false
            Log.d(LOG_TAG, isCheater.toString())
        }

    }





}
