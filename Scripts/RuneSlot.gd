class_name RuneSlot extends Node2D

@export var is_unlocked: bool = false
@export var rune_placement: Enums.RuneSlot = Enums.RuneSlot.FIRST
@export var locked_texture: Texture2D = null
@export var unlocked_texture: Texture2D = null
@onready var visual: Sprite2D = $Visual

func lock() -> void:
	is_unlocked = false
	visual.texture = locked_texture

func unlock() -> void:
	is_unlocked = true
	visual.texture = unlocked_texture
