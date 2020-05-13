package alperenugus.csci448.kotlinquiz

import android.util.Log
import androidx.lifecycle.ViewModel

object QuizViewModel: ViewModel() {
    private const val TAG = "448QuizViewModel"
    private val questionBank: MutableList<Question> = mutableListOf()
    private var score = 0
    private var currentQuestionIndex = 0

    init {
        // Add questions to the List
        Log.d(TAG, "ViewModel instance created")
        questionBank.add( Question(R.string.question1, false))
        questionBank.add( Question(R.string.question2, true))
        questionBank.add( Question(R.string.question3, false))
        questionBank.add( Question(R.string.question4, false))

    }

    override fun onCleared() {
        super.onCleared()
        Log.d(TAG, "ViewModel instance about to be destroyed")
    }

    private val currentQuestion: Question
        get() = questionBank.get(currentQuestionIndex)

    val currentQuestionTextId: Int
        get() = currentQuestion.textResId
    val currentQuestionAnswer: Boolean
        get() = currentQuestion.isAnswerTrue
    val currentScore: Int
        get() = score

    fun isAnswerCorrect(answer: Boolean, isCheated: Boolean):Boolean{
        if(answer == this.currentQuestionAnswer){
            if(!isCheated){
                this.score++
            }
            return true
        }
        else return false
    }

    fun moveToNextQuestion(){
        if (currentQuestionIndex == 3) currentQuestionIndex = 0
        else currentQuestionIndex++
    }

    fun moveToPreviousQuestion(){
        if (currentQuestionIndex == 0) currentQuestionIndex = 3
        else currentQuestionIndex--
    }

    fun getCurrentAnswer() = currentQuestion.isAnswerTrue


}