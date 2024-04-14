class_name OrderList extends VBoxContainer

var orders: Array[OrderCouple] = []
 
func add_order(text: String) -> void:
	var o = OrderCouple.new()
	o.key = text
	var l = Label.new()
	l.text = text
	add_child(l)
	o.val = l
	orders.append(o)
	
func remove_order(text: String) -> void:
	for i in orders.size():
		if orders[i].key == text:
			orders.remove_at(i)
			break

