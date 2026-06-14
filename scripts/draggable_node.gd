class_name DraggableNode
extends Control
var draggable:  bool = false
var offset:Vector2
var initial_position: Vector2

var ports: Array[Vector2i] 

var attached_node:Nodey


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed("left_click"):
			if not attached_node == null:
				TileManager.remove_node(attached_node)
			#if self.get_parent() == get_tree().root.get_node("/root/backpack/ScrollContainer/MarginContainer/GridContainer"):
			#initial_position = global_position
			offset = get_global_mouse_position() - global_position
			Globals.is_dragging = true
		if Input.is_action_pressed("left_click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("left_click"):
			Globals.is_dragging = false
			
			var snap_pos = global_position - Globals.GRID_OFFSET
			snap_pos = (snap_pos) / TileManager.GRID_SIZE
			snap_pos = snap_pos.round()
			if snap_pos.x > 9 or snap_pos.x < 0 or snap_pos.y > 9 or snap_pos.y < 0:
				self.reparent(get_tree().root.get_node("/root/backpack"))

				self.reparent(get_tree().root.get_node("/root/backpack/ScrollContainer/MarginContainer/GridContainer"))
				#tween.tween_property(self, "global_position", initial_position, 0.2).set_ease(Tween.EASE_OUT)
				return
			snap_pos = snap_pos * TileManager.GRID_SIZE
			snap_pos = snap_pos + Globals.GRID_OFFSET
			self.reparent(get_tree().root.get_node("/root/backpack"))
			#var tween = get_tree().create_tween()
			#tween.tween_property(self, "global_position", snap_pos, 0.05).set_ease(Tween.EASE_OUT)
			global_position = snap_pos
			TileManager.add_node(attached_node)
			
func set_texture(tex: CompressedTexture2D):
	$TextureRect.texture = tex

func _on_mouse_exited():
	if not Globals.is_dragging:
		draggable = false
		scale = Vector2(1,1)

func _on_mouse_entered() -> void:
	if not Globals.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)
