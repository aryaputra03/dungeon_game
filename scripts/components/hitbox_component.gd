class_name HitboxComponent
extends Area2D

@export var damage: int = 1
@export var knockback_force: float = 150.0

func _ready() -> void:
	monitoring = false       # hitbox hanya "dilihat" oleh hurtbox
	set_active(false)

func set_active(value: bool) -> void:
	set_deferred("monitorable", value)