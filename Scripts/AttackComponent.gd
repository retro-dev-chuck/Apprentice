class_name AttackComponent extends BaseComponent

@onready var area: Area2D = $RangeArea2D
@onready var circle_shape: CollisionShape2D = $RangeArea2D/CircleShape

var has_target_in_range: bool = false
var data: AttackData = null
var cd_timer: Timer = null
var _can_attack: bool = true

func initialize(_data: AttackData) -> void:
	data = _data
	if area == null:
		area = $RangeArea2D
		var shape = circle_shape.shape as CircleShape2D
		shape.radius = data.range
	if cd_timer == null:
		cd_timer = Timer.new()
		cd_timer.timeout.connect(_attack_cd_timer_timeout)
		add_child(cd_timer)
	_is_initialized = true 
		
func tick(delta: float) -> void:
	if !initialized():
		return
	if area.has_overlapping_bodies():
		has_target_in_range = true
		var overlaps = area.get_overlapping_bodies()

func _attack_cd_timer_timeout() -> void:
	_can_attack = true

func _exit_tree() -> void:
	cd_timer.timeout.disconnect(_attack_cd_timer_timeout)
