extends Node2D
var draggable:  bool = false
var offset:Vector2
var initial_position: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed("left_click"):
			initial_position = global_position
			offset = get_global_mouse_position() - global_position
			Globals.is_dragging = true
		if Input.is_action_pressed("left_click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("left_click"):
			Globals.is_dragging = false
			var tween = get_tree().create_tween()
			var snap_pos = global_position - Globals.GRID_OFFSET
			snap_pos = (snap_pos) / TileManager.GRID_SIZE
			snap_pos = snap_pos.round()
			if snap_pos.x > 9 or snap_pos.x < 0 or snap_pos.y > 9 or snap_pos.y < 0:
				tween.tween_property(self, "global_position", initial_position, 0.2).set_ease(Tween.EASE_OUT)
				return
			snap_pos = snap_pos * TileManager.GRID_SIZE
			snap_pos = snap_pos + Globals.GRID_OFFSET
			tween.tween_property(self, "global_position", snap_pos, 0.05).set_ease(Tween.EASE_OUT)
							
		


func _on_area_2d_mouse_entered() -> void:
	if not Globals.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	if not Globals.is_dragging:
		draggable = false
		scale = Vector2(1,1)


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
