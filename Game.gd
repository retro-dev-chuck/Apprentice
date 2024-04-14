class_name Game extends Node2D

@export var all_orders: Array[Order] = []
@onready var order_creator: OrderCreator = $OrderCreator
@onready var order_list: OrderList = $CanvasLayer/MarginContainer/OrderList

var time_between_orders: Vector2 = Vector2(3, 8)
var order_timeout: float = 30

func _ready() -> void:
	all_orders.append(order_creator.generate_tutorial_food())
	all_orders.append(order_creator.generate_easy_drink())
	all_orders.append(order_creator.generate_sauce())
	for order in all_orders:
		order_list.add_order(order.to_text())
