class_name Game extends Node2D

signal on_summoned(rune: RuneWord)
@export var all_orders: Array[Order] = []
@export var levels: Array[Level] = []
@onready var gameover: TextureRect = $CanvasLayer/gameover


@onready var order_creator: OrderCreator = $OrderCreator
@onready var order_list: OrderList = $CanvasLayer/MarginContainer/OrderList
@onready var rune_slots: RuneSlots = $RuneSlots
@onready var summon_circle_drink: SummonCircle = $SummonCircleDrink
@onready var summon_circle_food: SummonCircle = $SummonCircleFood

var initial_timer: Timer
var order_delay_timer: Timer
var current_level_index: int = 0
var order_count: int = 0
var level: Level = null
var time_down_every_5 = 1
var total_down = 0

func _ready() -> void:
	rune_slots.on_valid_summon.connect(_on_valid_summon)
	level = levels[current_level_index]
	
	initial_timer = Timer.new()
	add_child(initial_timer)
	initial_timer.timeout.connect(next_order)
	initial_timer.start(level.initial_delay)
	
	order_delay_timer = Timer.new()
	add_child(order_delay_timer)
	order_delay_timer.timeout.connect(next_order)
	
	for order in all_orders:
		order_list.add_order(order.to_text())

func next_order():
	initial_timer.stop()
	if order_count < level.starts_with.size():
		order_list.add_order(level.starts_with[order_count].to_text())
		order_count += 1
	else:
		var index = order_count - level.starts_with.size()
		var select = randf()
		var order = null
		if select < 0.5:
			order = order_creator.generate_easy_food()
		else:
			order = order_creator.generate_easy_drink()
		#else:
		#	order = order_creator.generate_sauce()
		if order != null:
			order_list.add_order(order.to_text())
			order_count += 1
	if order_count < level.total_orders:
		order_delay_timer.stop()
		if order_count >0 and order_count % 5 == 0:
			total_down = total_down +1	
		var time_between = level.time_between_orders - total_down * time_down_every_5
		time_between = clampf(time_between, 2, level.time_between_orders)
		order_delay_timer.start(time_between)
	
func _on_valid_summon(rune: RuneWord, runes: Array[RuneWord]) -> void:
	if rune.is_food():
		summon_circle_food.success(rune.sprite)
	if rune.is_drink():
		summon_circle_drink.success(rune.sprite)
	on_summoned.emit(rune)

func game_over() -> void:
	order_delay_timer.stop()
	order_delay_timer.queue_free()
	gameover.visible = true

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
