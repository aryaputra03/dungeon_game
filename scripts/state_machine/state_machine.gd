class_name StateMachine
extends Node

@export var initial_state: State
var current_state: State
var _states: Dictionary = {}

func _ready() -> void:
	await owner.ready
	for child in get_children():
		if child is State:
			_states[String(child.name).to_lower()] = child
			child.actor = owner
			child.transition_requested.connect(_on_transition_requested)
	if initial_state:
		current_state = initial_state
		current_state.enter()

func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _on_transition_requested(state_name: StringName, msg: Dictionary) -> void:
	var next: State = _states.get(String(state_name).to_lower())
	if next == null or next == current_state:
		return
	current_state.exit()
	current_state = next
	current_state.enter(msg)