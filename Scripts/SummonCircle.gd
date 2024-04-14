class_name SummonCircle extends Node2D

@onready var rune_slots: RuneSlots = $"../RuneSlots"

func _ready() -> void:
	rune_slots.on_valid_summon.connect(_on_valid_summon)
	
func _on_valid_summon(rune: RuneWord, runes: Array[RuneWord]) -> void:
	print("yesss")
