package alperenugus.csci448.kotlinquiz

class Question {
    var textResId: Int = 0
    var isAnswerTrue: Boolean = false

    constructor(Id:Int, answer:Boolean){
        textResId = Id
        isAnswerTrue = answer
    }
}