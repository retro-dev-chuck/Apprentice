class_name Unit extends CollisionBody

@export var data: UnitData = null

@onready var attack_component: AttackComponent = $AbsoluteUnit/AttackComponent
@onready var health_component: ResourceComponent = $HealthComponent
@onready var mana_component: ResourceComponent = $ManaComponent
@onready var visual: Sprite2D = $Visual
@onready var armor_component: ArmorComponent = $ArmorComponent

func _init(_data: UnitData, buff: Buff) -> void:
	data = _data.duplicate()
	data.apply_buff(buff)
	if data == null:
		printerr("Data is null on enemy!")
		return
	
	if data.group == Combat.Group.GOBLINS:
		attack_component.area.set_collision_layer_value(3, true)
		set_collision_mask_value(2, true)
	elif data.group == Combat.Group.SUMMONS:
		attack_component.area.set_collision_layer_value(2, true)
		set_collision_mask_value(3, true)
	else:
		printerr("undefined combat group")
	visual.texture = data.visual.texture
	if attack_component != null:
		attack_component.initialize(data.attack)
	if health_component != null:
		health_component.initialize(data.health)
		health_component.on_depleted.connect(_on_health_depleted)
	if mana_component != null:
		mana_component.initialize(data.mana)
	on_damaged.connect(_on_damaged)

func set_scale_multiplier(val: float) -> void:
	visual.scale = Vector2.ONE * val
	set_scale_multiplier(val)

func _on_damaged(damage_data: DamageData) -> void:
	if armor_component != null:
		health_component.decrease(armor_component.get_damage_amount(damage_data))
	else:
		health_component.decrease(damage_data.base_amount)
		
func _on_health_depleted() -> void:
	if health_component != null:
		health_component.on_depleted.disconnect(_on_health_depleted)
	on_damaged.disconnect(_on_damaged)
	queue_free()
	
func _process(delta: float) -> void:
	attack_component.tick(delta)
