class_name RunePlacer extends Node2D

@export var slots: Array[RuneSlot] = []

@onready var rune_parser: RuneParser = $RuneParser

var current_rune_index: int = 0

func _ready():
	rune_parser.on_runes_told.connect(try_place_runes)

func try_place_runes(words: Array[RuneWord]) -> void:
	for word in words:
		
	
func _process(delta: float):
	pass

