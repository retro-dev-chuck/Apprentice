class_name OrderList extends HBoxContainer

var orders: Array[OrderCouple] = []
@onready var game: Game = $"../../.."

@export var paper_scene: PackedScene = null  

func _ready() -> void:
	game.on_summoned.connect(_on_summon)

func _on_summon(rune: RuneWord) -> void:
	for order in orders:
		if order.key == rune.explanation:
			order.val.queue_free()
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
	
func remove_order(text: String) -> void:
	for i in orders.size():
		if orders[i].key == text:
			orders.remove_at(i)
			break

