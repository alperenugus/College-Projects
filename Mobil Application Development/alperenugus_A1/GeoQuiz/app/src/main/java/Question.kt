package alperenugus_a1.csci448.geoquiz

class Question {
    var Id: Int = 0
    // 0 for TF, 1 for Multiple Choice and 2 for Fill in the Blank
    var type: Int = 0
    lateinit var answer: String
    var isAnswered: Boolean = false
    var isCheated: Boolean = false
    var choice1: String = ""
    var choice2: String = ""
    var choice3: String = ""
    var choice4: String = ""

    constructor(Id:Int, type: Int, answer:String){
        this.Id = Id
        this.type = type
        this.answer = answer
    }

    constructor(Id:Int, type: Int, answer: String, choice1: String, choice2: String, choice3: String, choice4: String){
        this.Id = Id
        this.type = type
        this.answer = answer
        this.choice1 = choice1
        this.choice2 = choice2
        this.choice3 = choice3
        this.choice4 = choice4
    }
}