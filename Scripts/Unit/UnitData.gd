class_name UnitData extends Resource

@export var level: int = 1
@export var size_multiplier: float = 1.0
@export var group: Combat.Group = Combat.Group.NONE
@export var visual: VisualData = VisualData.new()
@export var health: ResourcePool = ResourcePool.new()
@export var mana: ResourcePool = ResourcePool.new()
@export var armor: ArmorData = ArmorData.new()
@export var attack: AttackData = AttackData.new()
@export var movement: MovementData = MovementData.new()

func apply_buff(buff: Buff) -> void:
	health.max_amount *= buff.health_bonus.max_amount
	health.regen_per_second *= buff.health_bonus.regen_per_second
	mana.max_amount *= buff.mana_bonus.max_amount
	mana.regen_per_second *= buff.mana_bonus.regen_per_second
	movement.speed *= buff.movement_bonus.speed
	size_multiplier *= buff.size_multiplier
