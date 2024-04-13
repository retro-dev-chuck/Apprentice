class_name ArmorComponent extends BaseComponent

var _data: ArmorData = null

func initialize(data: ArmorData) -> void:
	_data = data
	_is_initialized = true

func get_damage_amount(damage_data: DamageData) -> float:
	return damage_data.base_amount
