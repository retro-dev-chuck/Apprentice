class_name ResourceBar extends ProgressBar

@onready var resource: ResourceComponent = $".."

func _init() -> void:
	resource.on_value_updated.connect(value_updated)
	
func value_updated(current: float, max: float) -> void:
	max_value = max
	value = current
	if max_value < 1:
		visible = false
		resource.on_value_updated.disconnect(value_updated)
	
