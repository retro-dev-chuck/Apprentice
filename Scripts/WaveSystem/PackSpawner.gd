class_name PackSpawner extends Node2D

signal on_unit_spawned(unit)
signal on_spawn_completed()

@export var _timer: Timer

var _spawned_unit_count: int = 0
var _delay: float = 0
var _pack: PackData = null
var _parent: Node2D = null

func spawn_pack(delay: float, pack: PackData, unit_parent: Node2D) -> void:
	_delay = delay
	_pack = pack
	_parent = unit_parent
	if _timer == null: 
		_timer = _timer.new()
		_timer.timeout.connect(_try_spawn)
		add_child(_timer)
		
	_spawned_unit_count = 0
	_try_spawn()
			
func _try_spawn() -> void:
	if _spawned_unit_count >= _pack.units.size():
		on_spawn_completed.emit()
		return
	
	var unit = _pack.units[_spawned_unit_count].instantiate()
	_parent.add_child(unit)
	on_unit_spawned.emit(unit)
	
	_timer.start(_delay)
	_spawned_unit_count = _spawned_unit_count + 1

