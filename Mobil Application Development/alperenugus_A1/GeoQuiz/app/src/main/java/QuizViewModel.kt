package alperenugus_a1.csci448.geoquiz

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
        questionBank.add( Question(R.string.question1, 0, "false"))
        questionBank.add( Question(R.string.question5, 2, "1453"))
        questionBank.add( Question(R.string.question2, 0,"true"))
        questionBank.add( Question(R.string.question7, 1, "Joanne Rowling", "Steve Jobs", "Elon Musk", "Michael Jackson", "Joanne Rowling"))
        questionBank.add( Question(R.string.question3, 0,"false"))
        questionBank.add( Question(R.string.question6, 2,"Neil Armstrong"))
        questionBank.add( Question(R.string.question4, 0,"false"))
        questionBank.add( Question(R.string.question8, 1,"California", "Texas", "California", "New Jersey", "Utah"))
    }

    override fun onCleared() {
        super.onCleared()
        Log.d(TAG, "ViewModel instance about to be destroyed")
    }

    private val currentQuestion: Question
        get() = questionBank.get(currentQuestionIndex)

    val currentQuestionTextId: Int
        get() = currentQuestion.Id
    val currentQuestionAnswer: String
        get() = currentQuestion.answer
    val currentScore: Int
        get() = score

    fun isAnswerCorrect(answer: String, isCheated: Boolean):Boolean{
        questionBank.get(currentQuestionIndex).isAnswered = true
        if(answer.equals(this.currentQuestionAnswer)){
            if(!isCheated){
                this.score++
            }
            return true
        }
        else return false
    }

    fun moveToNextQuestion(){
        if (currentQuestionIndex == 7) currentQuestionIndex = 0
        else currentQuestionIndex++
    }

    fun moveToPreviousQuestion(){
        if (currentQuestionIndex == 0) currentQuestionIndex = 7
        else currentQuestionIndex--
    }

    fun getCurrentAnswer() = currentQuestion.answer

    // Check if the question is answered before.
    fun isAnswered(): Boolean {
        return questionBank.get(currentQuestionIndex).isAnswered
    }

    // Check if cheated on this question.
    fun isCheated(): Boolean {
        return questionBank.get(currentQuestionIndex).isCheated
    }
    // If user cheats once, set cheated flag of the current question to true so that the user
    // will not be able to return back to the question and answer it after cheating once.
    fun setCheated(){
        questionBank.get(currentQuestionIndex).isCheated = true
    }

    fun getQuestionType(): Int{
        return questionBank.get(currentQuestionIndex).type
    }

    fun getChoice1(): String{
        return questionBank.get(currentQuestionIndex).choice1
    }
    fun getChoice2(): String{
        return questionBank.get(currentQuestionIndex).choice2
    }
    fun getChoice3(): String{
        return questionBank.get(currentQuestionIndex).choice3
    }
    fun getChoice4(): String{
        return questionBank.get(currentQuestionIndex).choice4
    }


}