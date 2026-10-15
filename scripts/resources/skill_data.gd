class_name SkillData
extends Resource

@export var id: StringName
@export var display_name: String
@export var icon: Texture2D
@export var cooldown: float = 5.0
@export var damage: int = 1
@export var tags: Array[StringName] = []   # &"fire", &"projectile", &"aoe"
@export var effect_scene: PackedScene