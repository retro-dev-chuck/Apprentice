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

func is_food() -> bool:
	if meaning == Enums.Meaning.Burger or\
		meaning == Enums.Meaning.Salad or\
		meaning == Enums.Meaning.Fries:
			return true
	return false

func is_drink() -> bool:
	if meaning == Enums.Meaning.Coke:
			return true
	return false	
	
func is_sauce() -> bool:
	if meaning == Enums.Meaning.Ketchup or\
		meaning == Enums.Meaning.Mayo or\
		meaning == Enums.Meaning.SummonersSpecial:
			return true
	return false	


