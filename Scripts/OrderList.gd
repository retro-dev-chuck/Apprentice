class_name OrderList extends HBoxContainer

var orders: Array[OrderCouple] = []
@onready var game: Game = $"../../.."
@onready var order_count: Label = $"../../PanelContainer2/VBoxContainer/OrderCount"

@export var paper_scene: PackedScene = null  

var orders_delivered: int = 0

func _ready() -> void:
	game.on_summoned.connect(_on_summon)

func _on_summon(rune: RuneWord) -> void:
	for i in orders.size():
		var order = orders[i]
		if order.key == rune.explanation:
			order.val.queue_free()
			orders_delivered += 1
			order_count.text = str(orders_delivered)
			orders.remove_at(i)
			break;
			
func add_order(text: String) -> void:
	var paper = paper_scene.instantiate() as OrderPaper
	var o = OrderCouple.new()
	add_child(paper)
	text = text.replace("I want ", "").trim_prefix(" ").trim_suffix(" ")
	o.key = text
	paper.set_text(text)
	o.val = paper
	orders.append(o)
	if orders.size() > 5:
		game.game_over()
	
func remove_order(text: String) -> void:
	for i in orders.size():
		if orders[i].key == text:
			orders.remove_at(i)
			break

