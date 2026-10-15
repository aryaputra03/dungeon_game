class_name HurtboxComponent
extends Area2D

signal hit_received(hitbox: HitboxComponent)

@export var health_component: HealthComponent
## Matikan jika pemilik scene ingin menghitung damage sendiri (shield, armor, dll.)
@export var apply_damage_automatically: bool = true

var invulnerable: bool = false

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func set_invulnerable(value: bool) -> void:
	invulnerable = value

func _on_area_entered(area: Area2D) -> void:
	if invulnerable:
		return
	var hitbox := area as HitboxComponent
	if hitbox == null:
		return
	hit_received.emit(hitbox)
	if apply_damage_automatically and health_component:
		health_component.take_damage(hitbox.damage)