class_name ResourceComponent extends BaseComponent

signal on_depleted()
signal on_value_updated(current: float, max: float)

var _data: ResourcePool = null
var current_val: float
var _is_depleted: bool = false
var _regen_timer: Timer = null

func initialize(data: ResourcePool) -> void:
	_data = data
	if _regen_timer == null:
		_regen_timer = Timer.new()
		_regen_timer.timeout.connect(_regen_timeout)
	_regen_timer.start(1)
	_is_initialized = true
	current_val = _data.max_amount
	on_value_updated.emit(current_val, _data.max_amount)
	
func decrease(amount: float) -> void:
	if !initialized():
		return
	if _is_depleted:
		return
	current_val = clampf(current_val - amount, 0, _data.max_amount)
	if current_val == 0:
		_is_depleted = true
		on_depleted.emit()
	on_value_updated.emit(current_val, _data.max_amount)

func _regen_timeout() -> void:
	if !initialized():
		return
	if _is_depleted && !_data.regens_after_depletion:
		return
	
	current_val += _data.regen_per_second
	on_value_updated.emit(current_val, _data.max_amount)
	_is_depleted = false
	_regen_timer.start(1)

func _exit_tree() -> void:
	_regen_timer.timeout.disconnect(_regen_timeout)
