package alperenugus_a1.csci448.geoquiz

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.*

private const val LOG_TAG = "448.QuizActivity"
private const val REQUEST_CODE_CHEAT = 0;
private const val STATUS_OK = 0
private const val SAVED_CHEATER_VALUE = "IS_CHEATER"




class QuizActivity : AppCompatActivity() {

    private lateinit var parentLayout: LinearLayout
    private lateinit var scoreLayout: LinearLayout
    private lateinit var navigationLayout: LinearLayout
    private lateinit var cheatLayout: LinearLayout
    private lateinit var scoreTextView: TextView
    private lateinit var question_text_view: TextView
    private lateinit var TF_layout: LinearLayout
    private lateinit var MC_layout1: LinearLayout
    private lateinit var MC_layout2: LinearLayout
    private lateinit var FB_layout: LinearLayout
    private lateinit var trueButton: Button
    private lateinit var falseButton: Button
    private lateinit var A: Button
    private lateinit var B: Button
    private lateinit var C: Button
    private lateinit var D: Button
    private lateinit var fbText: EditText
    private lateinit var submit_Button: Button
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
        parentLayout = findViewById(R.id.parentLayout)
        scoreLayout = findViewById(R.id.score_layout)
        navigationLayout = findViewById(R.id.navigation_layout)
        cheatLayout = findViewById(R.id.cheat_layout)
        scoreTextView = findViewById( R.id.score_text_view )
        question_text_view = findViewById(R.id.question_text_view)
        trueButton = findViewById(R.id.true_button)
        falseButton = findViewById(R.id.false_button)
        A = findViewById(R.id.A)
        B = findViewById(R.id.B)
        C = findViewById(R.id.C)
        D = findViewById(R.id.D)
        fbText = findViewById(R.id.fb_text)
        submit_Button = findViewById(R.id.submit_button)
        nextButton = findViewById(R.id.next_button)
        prevButton = findViewById(R.id.prev_button)
        cheatButton = findViewById(R.id.cheat_button)
        TF_layout = findViewById(R.id.TF_layout)
        MC_layout1 = findViewById(R.id.MC_layout1)
        MC_layout2 = findViewById(R.id.MC_layout2)
        FB_layout = findViewById(R.id.FB_layout)


        // onClick Listeners for all buttons

        trueButton.setOnClickListener {
            checkAnswer("true")
        }

        falseButton.setOnClickListener {
            checkAnswer("false")
        }

        A.setOnClickListener {
            checkAnswer("" + A.text)
        }

        B.setOnClickListener {
            checkAnswer("" + B.text)
        }

        C.setOnClickListener {
            checkAnswer("" + C.text)
        }

        D.setOnClickListener {
            checkAnswer("" + D.text)
        }

        submit_Button.setOnClickListener {
            checkAnswer("" + fbText.text)
            fbText.text.clear()
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
        Log.d(LOG_TAG, resources.getString( QuizViewModel.currentQuestionTextId ))

        // TF Questions
        if(QuizViewModel.getQuestionType() == 0){
            parentLayout.removeAllViews()
            parentLayout.addView(scoreLayout)
            parentLayout.addView(question_text_view)
            parentLayout.addView(TF_layout)
            parentLayout.addView(navigationLayout)
            parentLayout.addView(cheatLayout)
        }
        // Multiple Choice
        if(QuizViewModel.getQuestionType() == 1){
            parentLayout.removeAllViews()
            parentLayout.addView(scoreLayout)
            parentLayout.addView(question_text_view)
            parentLayout.addView(MC_layout1)
            parentLayout.addView(MC_layout2)
            A.text = QuizViewModel.getChoice1()
            B.text = QuizViewModel.getChoice2()
            C.text = QuizViewModel.getChoice3()
            D.text = QuizViewModel.getChoice4()
            parentLayout.addView(navigationLayout)
            parentLayout.addView(cheatLayout)
        }
        // Fill in the Blank
        if(QuizViewModel.getQuestionType() == 2){
            parentLayout.removeAllViews()
            parentLayout.addView(scoreLayout)
            parentLayout.addView(question_text_view)
            parentLayout.addView(FB_layout)
            parentLayout.addView(navigationLayout)
            parentLayout.addView(cheatLayout)
        }

    }

    private fun setCurrentScoreText() {
        scoreTextView.text = QuizViewModel.currentScore.toString()
    }

    fun checkAnswer(answer:String){
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

