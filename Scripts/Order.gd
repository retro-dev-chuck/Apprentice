class_name Order extends Resource

@export var value: Array[RuneWord] = []

func to_text() -> String:
	var sentence = ""
	for rune in value:
		sentence = sentence + rune.explanation + " "
	return sentence
