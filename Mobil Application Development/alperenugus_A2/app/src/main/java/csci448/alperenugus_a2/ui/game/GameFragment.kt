package csci448.alperenugus_a2.ui.game

import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.preference.PreferenceManager
import csci448.alperenugus_a2.R
import csci448.alperenugus_a2.data.History
import java.util.*
import kotlin.collections.ArrayList
import kotlin.math.log

private val logTag: String = "448.GameFragment"
private val SAVED_PLAYER1 = "SavedPlayer1"
private val SAVED_PLAYER2 = "SavedPlayer2"
private val SAVED_TURN = "SavedTurn"
private val SAVED_WINNER = "SavedWinner"

class GameFragment: Fragment() {

    private lateinit var buttons: ArrayList<Button>
    private lateinit var btn1: Button
    private lateinit var btn2: Button
    private lateinit var btn3: Button
    private lateinit var btn4: Button
    private lateinit var btn5: Button
    private lateinit var btn6: Button
    private lateinit var btn7: Button
    private lateinit var btn8: Button
    private lateinit var btn9: Button
    private lateinit var winnerTextView: TextView
    private lateinit var playAgainBtn: Button
    private lateinit var returnBtn: Button

    private lateinit var player1: ArrayList<Int>
    private lateinit var player2: ArrayList<Int>


    private var turn = true; // True stands for player1
    private var winner = -1; // 0 stands for no winner

    // Preferences values
    private var multiplayer: Boolean? = false
    private var difficulty: String? = "Easy"
    var firstPlayer: Boolean? = false
    var pieceSymbol1: String = "X"
    var pieceSymbol2: String = "O"

    private lateinit var factory: GameFragmentViewModelFactory

    private val gameFragmentViewModel: GameFragmentViewModel by lazy {
        ViewModelProvider(this@GameFragment, factory)
            .get(GameFragmentViewModel::class.java)
    }

    private var callbacks: Callbacks? = null

    // Tell the MainActivity to change the fragment
    interface Callbacks{
        fun onGameReturnClicked()
        fun onGamePlayAgainClicked()
    }

    override fun onAttach(context: Context) {
        Log.d(logTag, "onAttach called")
        super.onAttach(context)
        callbacks = context as Callbacks
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        Log.d(logTag, "onCreate called")
        retainInstance = true;
        super.onCreate(savedInstanceState)
        // Enable the menu
        setHasOptionsMenu(true)

        // These lists are to store the clicked buttons by the players
        player1 = ArrayList()
        player2 = ArrayList()
        buttons = ArrayList()
        factory = GameFragmentViewModelFactory(requireContext())

        // Get the saved data from the savedInstanceState if it exists
        if(savedInstanceState != null){

            Log.d(logTag, " LOADING PREVIOUS DATA")

            var savedPlayer1: ArrayList<Int> = savedInstanceState.getIntegerArrayList(SAVED_PLAYER1) as ArrayList<Int>
            var savedPlayer2: ArrayList<Int> = savedInstanceState.getIntegerArrayList(SAVED_PLAYER2) as ArrayList<Int>

            player1 = savedPlayer1
            player2 = savedPlayer2

            turn = savedInstanceState.getBoolean(SAVED_TURN)
            winner = savedInstanceState.getInt(SAVED_WINNER)

            Log.d(logTag, player1.toString())
            Log.d(logTag, player2.toString())
        }

    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        Log.d(logTag, "onCreateView called")

        val view = inflater.inflate(R.layout.game, container, false)

        // Since if we rotate to landscape mode and then back, the fragment wont be created again, so in order
        // to get rid of the previous button objects, clear buttons
        buttons.clear()

        // Get setting values from the Shared Preferences
        val sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context)

        multiplayer = sharedPreferences.getBoolean("numPlayerKey", false)
        difficulty = sharedPreferences.getString("difficultyKey", "Easy")
        firstPlayer = sharedPreferences.getBoolean("firstPlayerKey", false)

        // Change the firstPlayer symbol with respect to the selected preference
        if(firstPlayer as Boolean){
            pieceSymbol1 = "O"
            pieceSymbol2 = "X"
        }


        winnerTextView = view.findViewById(R.id.winnerText)
        winnerTextView.visibility = View.GONE

        // If the game is not finished, these two buttons should be invisible
        playAgainBtn = view.findViewById(R.id.play_again_btn)
        playAgainBtn.visibility = View.GONE
        returnBtn = view.findViewById(R.id.return_btn)
        returnBtn.visibility = View.GONE

        // Bind the buttons to the layout and add them to an array to be able to iterate on them
        btn1 = view.findViewById(R.id.btn1)
        buttons.add(btn1)
        btn2 = view.findViewById(R.id.btn2)
        buttons.add(btn2)
        btn3 = view.findViewById(R.id.btn3)
        buttons.add(btn3)
        btn4 = view.findViewById(R.id.btn4)
        buttons.add(btn4)
        btn5 = view.findViewById(R.id.btn5)
        buttons.add(btn5)
        btn6 = view.findViewById(R.id.btn6)
        buttons.add(btn6)
        btn7 = view.findViewById(R.id.btn7)
        buttons.add(btn7)
        btn8 = view.findViewById(R.id.btn8)
        buttons.add(btn8)
        btn9 = view.findViewById(R.id.btn9)
        buttons.add(btn9)

        Log.d(logTag, "onCreateView LOADING DATA")
        Log.d(logTag, player1.toString())
        Log.d(logTag, player2.toString())


        // Save the previous instance state before the rotation change if there exists a saved instance
        buttons.forEachIndexed { index, button ->
            Log.d(logTag, "Whoaaa Here")

            if(player1.contains(index + 1)){
                Log.d(logTag, "Player 1 Here")
                button.text = pieceSymbol1
                button.isEnabled = false
            }
            if(player2.contains(index + 1)){
                Log.d(logTag, "Player 2 Here")
                button.text = pieceSymbol2
                button.isEnabled = false
            }
        }


        btn1.setOnClickListener {
            buttonAction(btn1)
        }

        btn2.setOnClickListener {
            buttonAction(btn2)
        }

        btn3.setOnClickListener {
            buttonAction(btn3)
        }

        btn4.setOnClickListener {
            buttonAction(btn4)
        }

        btn5.setOnClickListener {
            buttonAction(btn5)
        }

        btn6.setOnClickListener {
            buttonAction(btn6)
        }

        btn7.setOnClickListener {
            buttonAction(btn7)
        }

        btn8.setOnClickListener {
            buttonAction(btn8)
        }

        btn9.setOnClickListener {
            buttonAction(btn9)
        }

        // Reset everything on the screen
        playAgainBtn.setOnClickListener {
            callbacks?.onGamePlayAgainClicked()
        }

        // Return to the WelcomeFragment
        returnBtn.setOnClickListener {
            callbacks?.onGameReturnClicked()
        }

        // Check if the game is finished before the orientation change
        checkSavedWinner()

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
        callbacks = null
    }

    fun buttonAction(btn: Button){
        btn.isEnabled = false

        // Person vs Person
        if(multiplayer!!){
            // Check the turn, if true then first player moves
            if (turn){
                btn.text = pieceSymbol1

                buttons.forEachIndexed { index, button ->
                    if(btn.id == button.id) player1.add(index + 1)
                }
            }
            // If the turn is false, then the second player moves
            else{
                btn.text = pieceSymbol2
                buttons.forEachIndexed { index, button ->
                    if(btn.id == button.id) player2.add(index + 1)
                }
            }

//            Log.d(logTag, player1.toString())
//            Log.d(logTag, player2.toString())

            // Change the turn after each move
            turn = !turn

        }
        // Person vs Computer
        else{
            Log.d(logTag, "I am here!")

            // User Input
            btn.text = pieceSymbol1
            buttons.forEachIndexed { index, button ->
                if(btn.id == button.id) player1.add(index + 1)
            }

            Log.d(logTag, difficulty.toString())

            Log.d(logTag, checkWinner().toString())

            // Computer Easy Move
            if(difficulty.equals("Easy") && !checkWinner()){
                computerEasyMove()
            }

            // Computer Hard Move
            if (difficulty.equals("Hard")  && !checkWinner()){
                computerHardMove()
            }

        }

        // In each move, check if the game is finished
        var finish = checkWinner()

        // Game finished
        if(finish){
            // Disable the buttons and display playAgain and return buttons
            disableButtons()
            playAgainBtn.visibility = View.VISIBLE
            returnBtn.visibility = View.VISIBLE
            winnerTextView.text = winnerTextView.text.toString() + winner.toString()

            // Values for the history record
            var date = Date()
            var whoWon: String = ""
            var piece: String = ""

            // Find out who won the game
            if(!multiplayer!! && winner == 1) whoWon = "Player 1"
            else if(!multiplayer!! && winner == 2) whoWon = "Computer"
            else if(multiplayer!! && winner == 1) whoWon = "Player 1"
            else if(multiplayer!! && winner == 2) whoWon = "Player 2"
            else whoWon = "Tie"

            if(winner == 1) piece = pieceSymbol1
            else if(winner == 2) piece = pieceSymbol2
            else piece = "^.^"

            // Create a new History object to be able to persist it to the database
            var history = History()
            history.winner = whoWon
            history.date = date
            history.piece = piece
            // Save the record using the viewModel
            gameFragmentViewModel.addRecord(history)
        }

    }


    fun checkWinner() : Boolean{
        // Checks the arrays and tells the winner with respect to the values in the integer arraylists for each player
        if(checkWinnerHelper(player1)){
            winner = 1
            winnerTextView.visibility = View.VISIBLE

            return true
        }
        // Checks the arrays and tells the winner with respect to the values in the integer arraylists for each player
        if(checkWinnerHelper(player2)){
            winner = 2
            winnerTextView.visibility = View.VISIBLE

            return true
        }

        // All buttons clicked, no winner
        if(!btn1.isEnabled && !btn2.isEnabled && !btn3.isEnabled && !btn4.isEnabled && !btn5.isEnabled &&
            !btn6.isEnabled && !btn7.isEnabled && !btn8.isEnabled && !btn9.isEnabled){
            winner = 0
            winnerTextView.visibility = View.VISIBLE

            return true
        }

        return false
    }

    fun disableButtons(){
        for(button in buttons){
            button.isEnabled = false
        }
    }

    // Check all the possible winning positions for 9 buttons
    fun checkWinnerHelper(player: List<Int>): Boolean{
        //Log.d(logTag, player.toString())
        if ((player.contains(1) && player.contains(2) && player.contains(3)) ||
                (player.contains(4) && player.contains(5) && player.contains(6)) ||
                (player.contains(7) && player.contains(8) && player.contains(9)) ||
                (player.contains(1) && player.contains(4) && player.contains(7)) ||
                (player.contains(2) && player.contains(5) && player.contains(8)) ||
                (player.contains(3) && player.contains(6) && player.contains(9)) ||
                (player.contains(1) && player.contains(5) && player.contains(9)) ||
                (player.contains(3) && player.contains(5) && player.contains(7))) return true

        return false
    }

    // Take the first empty place and put the symbol
    fun computerEasyMove(){
        buttons.forEachIndexed { index, button ->
            if(button.isEnabled){
                button.isEnabled = false
                button.text = pieceSymbol2
                player2.add(index+1)
                return
            }
        }
    }

    // Randomly pick a place and put the symbol
    fun computerHardMove(){

        var flag = false

        while (!flag){

            var rand = (0 until 9).random()

            if(buttons[rand].isEnabled){
                buttons[rand].text = pieceSymbol2
                buttons[rand].isEnabled = false
                player2.add(rand + 1)
                flag = true
                Log.d(logTag, "Computer Hard Moveeeee")
            }
        }
    }

    // Put the required variables to save the current instance state
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putIntegerArrayList(SAVED_PLAYER1, player1)
        outState.putIntegerArrayList(SAVED_PLAYER2, player2)
        outState.putBoolean(SAVED_TURN, turn)
        outState.putInt(SAVED_WINNER, winner)
    }

    // Check if the game is finished before the orientation change
    fun checkSavedWinner(){
        if(winner != -1){
            disableButtons()
            playAgainBtn.visibility = View.VISIBLE
            returnBtn.visibility = View.VISIBLE
            winnerTextView.text = winnerTextView.text.toString() + winner.toString()
            winnerTextView.visibility = View.VISIBLE
        }
    }

}