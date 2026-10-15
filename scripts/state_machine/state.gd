class_name State
extends Node

signal transition_requested(state_name: StringName, msg: Dictionary)

var actor: Node   # diisi StateMachine (pemilik scene)

func enter(_msg: Dictionary = {}) -> void: pass
func exit() -> void: pass
func handle_input(_event: InputEvent) -> void: pass
func update(_delta: float) -> void: pass
func physics_update(_delta: float) -> void: pass