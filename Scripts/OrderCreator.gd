class_name OrderCreator extends Node2D

@export var summon: RuneWord = null
@export var fries: RuneWord = null
@export var foods: Array[RuneWord] = []
@export var drinks: Array[RuneWord] = []
@export var sauces: Array[RuneWord] = []

var sauce_chance: float = .5

func generate_tutorial_food() -> Order:
	var order= Order.new()
	order.value.append(summon)
	order.value.append(fries)
	return order
	
func generate_easy_food() -> Order:
	var order= Order.new()
	order.value.append(summon)
	var food = foods[randi() % foods.size()]
	order.value.append(food)
	return order

func generate_easy_drink() -> Order:
	var order= Order.new()
	order.value.append(summon)
	var drink = drinks[randi() % drinks.size()]
	order.value.append(drink)
	return order
	
func generate_sauce() -> Order:
	var order= Order.new()
	order.value.append(summon)
	var sauce = sauces[randi() % sauces.size()]
	order.value.append(sauce)
	return order
	
