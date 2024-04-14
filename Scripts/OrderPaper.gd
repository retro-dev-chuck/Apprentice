class_name OrderPaper extends TextureRect
@onready var label: Label = $Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func set_text(str: String) -> void:
	animation_player.play("appear")
	label.text = str
