class_name EnemyData
extends Resource

@export var id: StringName
@export var display_name: String
@export var max_health: int = 10
@export var move_speed: float = 60.0
@export var contact_damage: int = 1
@export var aggro_range: float = 120.0
@export var drops: Array[ItemData] = []