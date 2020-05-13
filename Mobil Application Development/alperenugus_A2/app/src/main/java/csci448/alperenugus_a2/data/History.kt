package csci448.alperenugus_a2.data

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.*

@Entity
data class History(@PrimaryKey val id: UUID = UUID.randomUUID(),
                   var winner: String = "",
                   var piece: String = "",
                   var date: Date = Date()
                   )