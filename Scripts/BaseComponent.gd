class_name BaseComponent extends Node2D

var _is_initialized: bool = false

func initialized() -> bool:
	return _is_initialized
	
func tick(delta: float) -> void:
	pass
