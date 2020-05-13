package com.csci448.beatbox

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.MotionEvent
import android.view.ScaleGestureDetector
import android.view.View
import android.view.ViewGroup
import android.widget.SeekBar
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.csci448.beatbox.databinding.ActivityMainBinding
import com.csci448.beatbox.databinding.ListItemSoundBinding

class MainActivity : AppCompatActivity(), SeekBar.OnSeekBarChangeListener {

    // Helper class to load music files from assets
    private lateinit var beatBox: BeatBox
    private lateinit var scaleListener: ScaleGestureDetector
    private lateinit var binding: ActivityMainBinding

    private var scaleFactor: Float = 3.0f

    companion object{
        var playSpeed: Float = 100.0f
    }

    private inner class ScaleListener
        : ScaleGestureDetector.SimpleOnScaleGestureListener() {

        override fun onScale(detector: ScaleGestureDetector?): Boolean {
            scaleFactor *= detector?.scaleFactor ?: 1.0f

            // Keep scaleFactor within a certain interval
            if(scaleFactor > 8.0f) scaleFactor = 8.0f
            if(scaleFactor < 1.0f) scaleFactor = 1.0f

            // Change the recyclerView with respect to the new scaleFactor
            binding.recyclerView.layoutManager = GridLayoutManager(baseContext, scaleFactor.toInt())

            return super.onScale(detector)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        beatBox = BeatBox(assets)
        scaleListener = ScaleGestureDetector(baseContext, ScaleListener())

        // Binding object
        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)

        binding.recyclerView.apply {
            // Set 3x3 grid layout for the layout using the binding object
            layoutManager = GridLayoutManager(context, scaleFactor.toInt())
            adapter = SoundAdapter(beatBox.sounds)

            setOnTouchListener { v: View, event: MotionEvent ->
                scaleListener.onTouchEvent(event)
                if(!scaleListener.isInProgress) {
                    onTouchEvent(event)
                }
                true
            }
        }

        binding.playbackSpeedSeekBar.setOnSeekBarChangeListener(this)
        binding.playbackSpeedSeekBar.progress = 100

        binding.playbackTextView.text = String.format(resources.getString(R.string.playback_speed_label), 100)



    }

    private inner class SoundHolder(private val binding: ListItemSoundBinding) : RecyclerView.ViewHolder(binding.root){
        init {
            binding.viewModel = SoundViewModel(beatBox)
        }

        fun bind(sound: Sound) {
            binding.apply {
                viewModel?.sound = sound
                executePendingBindings()
            }
        }
    }

    private inner class SoundAdapter(private val sounds: List<Sound>): RecyclerView.Adapter<SoundHolder>(){
        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int):

                SoundHolder{
            val binding = DataBindingUtil.inflate<ListItemSoundBinding>(
                layoutInflater,
                R.layout.list_item_sound,
                parent,
                false
            )
            return SoundHolder(binding)
        }

        override fun getItemCount() = sounds.size

        override fun onBindViewHolder(holder: SoundHolder, position: Int) {
            val sound = sounds[position]
            holder.bind(sound)
        }

    }

    override fun onDestroy() {
        super.onDestroy()
        beatBox.release()
    }

    override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
        if (seekBar != null) {
            binding.playbackTextView.text = String.format(resources.getString(R.string.playback_speed_label), seekBar.progress)
            playSpeed = seekBar.progress.toFloat()
        }
    }

    override fun onStartTrackingTouch(seekBar: SeekBar?) {
    }

    override fun onStopTrackingTouch(seekBar: SeekBar?) {
    }

}
