class_name RuneSlots extends Node2D

signal on_valid_summon(rune: RuneWord, runes: Array[RuneWord])

@export var initial_unlocks: int = 4
@export var max_slots: int = 4
@export var slot_scene: PackedScene = null
@export var slots: Array[RuneSlot] = []
@export var hor_dist: float = 10
@onready var rune_parser: RuneParser = $"../RuneParser"
@export var summon_rune: RuneWord = null

var current_unlocks: int = 0
func _ready() -> void:
	for i in max_slots:
		var slot = slot_scene.instantiate() as RuneSlot
		slot.position = position + Vector2.RIGHT * i * hor_dist
		add_child(slot)
		if i < initial_unlocks:
			slot.unlock()
		else:
			slot.lock()
	current_unlocks = initial_unlocks
	rune_parser.on_runes_told.connect(_on_runes_told)
	
func _on_runes_told(runes: Array[RuneWord]) -> void:
	if runes.size() > current_unlocks: 
		printerr("Discarding extra runes!")
		runes = runes.slice(0, current_unlocks)
	if runes[0] != summon_rune:
		printerr("first rune must be summon rune")
		return
	if runes[-1].placement != Enums.RuneSlot.LAST:
			printerr("invalid_last_rune")
			return
	else:
		var data = runes[-1].duplicate()
		runes.remove_at(0)
		runes.remove_at(runes.size()-1)
		on_valid_summon.emit(data, runes)	
