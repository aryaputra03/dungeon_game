extends Node

var run_seed: int = 0
var gold: int = 0          # mata uang dalam run
var is_run_active: bool = false

func start_run(seed_value: int = 0) -> void:
	run_seed = seed_value if seed_value != 0 else randi()
	gold = 0
	is_run_active = true
	EventBus.run_started.emit()

func end_run(victory: bool) -> void:
	is_run_active = false
	EventBus.run_ended.emit(victory)