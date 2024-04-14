class_name MovementComponent extends BaseComponent
@onready var attack_component: AttackComponent = $"../AttackComponent"
@onready var unit_base: Unit = $".."

var _data: MovementData = null
var _dir: Vector2 = Vector2.ZERO
	
func initialize(data: MovementData, dir: Vector2) -> void:
	_data = data
	_is_initialized = true
	

func tick(delta: float) -> void:
	if !initialized():
		return
	if attack_component.has_target_in_range:
		return
	#todo: add movement
