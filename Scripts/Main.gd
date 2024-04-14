class_name Main extends Control
func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().change_scene_to_file("res://Game.tscn")
