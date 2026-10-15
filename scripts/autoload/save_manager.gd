extends Node

const SAVE_PATH := "user://save.json"
const BACKUP_PATH := "user://save.json.bak"
const SAVE_VERSION := 1

var data: Dictionary = {}

func _ready() -> void:
	load_game()

func _default_data() -> Dictionary:
	return {
		"save_version": SAVE_VERSION,
		"essence": 0,          # mata uang meta
		"unlocks": [],
		"settings": {},
	}

func save_game() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.copy_absolute(SAVE_PATH, BACKUP_PATH)
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("Gagal menyimpan: %s" % error_string(FileAccess.get_open_error()))
		return
	file.store_string(JSON.stringify(data, "\t"))

func load_game() -> void:
	data = _read_file(SAVE_PATH)
	if data.is_empty():
		data = _read_file(BACKUP_PATH)   # fallback jika save utama rusak
	if data.is_empty():
		data = _default_data()
	_migrate()

func _read_file(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}

func _migrate() -> void:
	# Contoh nanti: if data.save_version < 2: ... lalu naikkan versi
	data["save_version"] = SAVE_VERSION