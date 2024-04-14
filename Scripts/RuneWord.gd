class_name RuneWord extends Resource

@export var explanation: String = ""
@export var meaning: Enums.Meaning = Enums.Meaning.Summon
@export var placement: Enums.RuneSlot = Enums.RuneSlot.FIRST
@export var word: String = "-"
@export var sprite: Texture2D = null
@export var unit: UnitData = null
@export var buff: Buff = null
@export var first_adj: Array[RuneWord] = []
@export var second_adj: Array[RuneWord] = []
