class_name SummonCircle extends Node2D
@onready var rune_slots: RuneSlots = $"../RuneSlots"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var item: Sprite2D = $Item
var timer: Timer 

func _ready() -> void:
	create_timer_if_null()
	timer.timeout.connect(reset)
	
func create_timer_if_null() -> void:
	if timer == null:
		timer = Timer.new()
		add_child(timer)
		
func fail() -> void: 
	animation_player.play("fail")
	create_timer_if_null()
	timer.start(2)

func success(tex: Texture2D) -> void:
	animation_player.play("appear")
	item.texture = tex
	create_timer_if_null()
	timer.start(2)
	
func reset() -> void:
	animation_player.stop()
