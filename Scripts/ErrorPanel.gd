class_name ErrorPanel extends PanelContainer
@onready var text: Label = $Text

var timer: Timer

func show_error(t: String) -> void: 
	if timer == null:
		timer = Timer.new()
		add_child(timer)
		timer.timeout.connect(hide_panel)
	timer.start(3)
	visible = true
	text.text = t

func hide_panel() -> void:
	visible = false
