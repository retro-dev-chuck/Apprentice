class_name CollisionBody extends StaticBody2D
@onready var circle_shape: CollisionShape2D = $CollisionShape2D
var base_radius: float = -1

signal on_damaged(damage_data: DamageData)

func damaged(damage_data: DamageData) -> void:
	on_damaged.emit(damage_data)

func set_scale_multiplier(multiplier: float) -> void:
	var shape = circle_shape.shape as CircleShape2D
	if base_radius == -1:
		base_radius = shape.radius
	shape.radius = base_radius * multiplier
