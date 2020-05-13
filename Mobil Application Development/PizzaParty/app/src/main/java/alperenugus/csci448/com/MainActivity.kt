package alperenugus.csci448.com

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.RadioGroup
import android.widget.TextView
import java.lang.Math.ceil

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // get reference to all our view objects
        val calculateButton: Button = findViewById(R.id.calculate_button)
        val numPeopleEditText: EditText = findViewById(R.id.num_people_edit_text)
        val hungryRG: RadioGroup = findViewById(R.id.how_hungry_radio_group)
        val numPizzasTextView: TextView = findViewById(R.id.num_pizzas_text_view)

        // set calculate click listener
        calculateButton.setOnClickListener{
            val numPeople: Int = numPeopleEditText.text.toString().toInt()

            var slicesPerPerson = when(hungryRG.checkedRadioButtonId){
                R.id.light_radio_button -> 1
                R.id.medium_radio_button -> 2
                R.id.heavy_radio_button -> 4
                else -> 0
            }

            var slicesPerPizza = 8.0 // double literal

            // peform calculation
            var totalNumberPizzas = ceil(numPeople * slicesPerPerson / slicesPerPizza).toInt()
            // set output to screen
            numPizzasTextView.text = totalNumberPizzas.toString()
        }

    }
}
