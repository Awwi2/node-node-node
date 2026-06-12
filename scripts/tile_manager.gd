extends Node2D

const bdn = preload("res://scenes/basic_damage_nodey.tscn")

var tiles : Dictionary[Vector2i,Node2D] = {}
const GRID_SIZE = 128

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position = get_global_mouse_position().snapped(Vector2(GRID_SIZE, GRID_SIZE))
		var pos = position / 128
		if is_open(pos):
			return

func is_open(pos: Vector2i) -> bool:
	return tiles.get(pos) == null
