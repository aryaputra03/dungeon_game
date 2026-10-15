class_name ItemData
extends Resource

enum Type { MATERIAL, AMMO, GADGET, WEAPON, CONSUMABLE }

@export var id: StringName
@export var display_name: String
@export_multiline var description: String
@export var icon: Texture2D
@export var type: Type = Type.MATERIAL
@export var stackable: bool = true
@export var max_stack: int = 99
@export var trade_value: int = 1      # untuk sistem trade nanti