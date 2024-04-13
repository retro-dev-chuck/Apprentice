class_name UnitData extends Resource

@export var level: int = 1
@export var group: Combat.Group = Combat.Group.NONE
@export var visual: VisualData = VisualData.new()
@export var health: ResourcePool = ResourcePool.new()
@export var mana: ResourcePool = ResourcePool.new()
@export var armor: ArmorData = ArmorData.new()
@export var attack: AttackData = AttackData.new()
@export var movement: MovementData = MovementData.new()

