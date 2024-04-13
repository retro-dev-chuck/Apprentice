class_name Game extends Node2D
@export var wave_data: WaveData = null
@onready var wave_spawner: WaveSpawner = $WaveSpawner

func _ready():
	wave_spawner.spawn_wave(wave_data)

