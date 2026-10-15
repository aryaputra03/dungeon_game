extends Node

@warning_ignore_start("unused_signal")
signal player_died
signal enemy_killed(enemy: Node)
signal hitstop_requested(frames: int)
signal screen_shake_requested(strength: float, duration: float)
signal room_cleared
signal run_started
signal run_ended(victory: bool)
signal item_picked_up(item: Resource, amount: int)
