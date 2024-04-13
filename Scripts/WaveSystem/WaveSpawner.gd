class_name WaveSpawner extends Node2D

var enemy_parent: Node2D

var _initial_timer: Timer
var _pack_timer: Timer

var packs_spawn_count: int = 0
var _wave: WaveData
var pack_spawner: PackSpawner = null

func spawn_wave(wave_data: WaveData) -> void:
	if enemy_parent == null:
		enemy_parent = Node2D.new()
		enemy_parent.position = position
		add_child(enemy_parent)
		
	_wave = wave_data 
	if(_initial_timer == null):
		_initial_timer = Timer.new()
		_initial_timer.timeout.connect(_initial_delay_timeout)
		_initial_timer.start(wave_data.initial_delay)
		
func _initial_delay_timeout() -> void:
	if enemy_parent == null:
		enemy_parent = Node2D.new()
		
	if pack_spawner == null:
		pack_spawner = PackSpawner.new()
		add_child(pack_spawner)
		pack_spawner.on_spawn_completed.connect(_on_pack_spawn_completed)
		
func _on_pack_spawn_completed() -> void:
	if packs_spawn_count >= _wave.spawn_list.size():
		return
	pack_spawner.spawn_pack(_wave.delay_between_packs, _wave.spawn_list[packs_spawn_count], enemy_parent)
	packs_spawn_count = packs_spawn_count + 1
	
