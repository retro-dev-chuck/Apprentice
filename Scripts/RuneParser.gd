class_name RuneParser extends Node2D

signal on_runes_told(runes: Array[RuneWord])

@export var unlocked_runes: Array[RuneWord] = []
@onready var rune_input_handle: RuneInputHandle = $"../RuneInputHandle"
@onready var error_panel: ErrorPanel = %ErrorPanel

func _ready() -> void:
	rune_input_handle.on_apprentice_talked.connect(_on_apprentice_talked)
	
func _on_apprentice_talked(text: String) -> void:
	var words: PackedStringArray = text.split(" ")
	if is_valid_words(words):
		var runes: Array[RuneWord] = get_runes(words)
		if runes.size() != 2:
			error_panel.show_error("Need to use 2 runes to summon")
		else:
			on_runes_told.emit(runes)
	else: 
		error_panel.show_error("Invalid runewords, type runes from list!")

func is_valid_words(words: PackedStringArray) -> bool:
	for word in words:
		var found_rune_for_word = false
		for rune in unlocked_runes:
			if rune.word == word:
				found_rune_for_word = true
		if !found_rune_for_word:
			return false
	return true

func get_runes(words: PackedStringArray) -> Array[RuneWord]:
	var runes: Array[RuneWord] = []
	for word in words:
		for rune in unlocked_runes:
			if rune.word == word:
				runes.append(rune) 
	return runes
