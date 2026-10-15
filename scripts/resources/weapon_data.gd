class_name WeaponData
extends Resource

@export var id: StringName
@export var display_name: String
@export var icon: Texture2D
@export var base_damage: int = 1
@export var attack_duration: float = 0.3
@export var combo_count: int = 3
@export var reach: float = 24.0
@export var lunge_distance: float = 8.0
@export var has_durability: bool = false   # untuk senjata sekunder
@export var max_durability: int = 0