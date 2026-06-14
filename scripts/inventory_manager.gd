extends Node
const DRAGGABLE_NODE = preload("uid://cuwehglyimia7")
const RELAY_NODE = preload("uid://c6ipwji5grl0y")
const PLUS_NODE = preload("uid://e0dh5t3j38u5")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var d1:DraggableNode = DRAGGABLE_NODE.instantiate()
	var new_node:Nodey =  RELAY_NODE.instantiate()
	new_node.ports = [Vector2i.RIGHT, Vector2i.LEFT, 
		Vector2i.UP, Vector2i.DOWN]
	d1.attached_node = new_node
	d1.add_child(new_node)
	var g_container = get_tree().root.get_node("/root/backpack/ScrollContainer/MarginContainer/GridContainer")
	g_container.add_child(d1)
	
	var d2: DraggableNode = DRAGGABLE_NODE.instantiate()
	var newer_node: Nodey =PLUS_NODE.instantiate()
	newer_node.ports = [Vector2i.RIGHT, Vector2i.LEFT, 
		Vector2i.UP, Vector2i.DOWN]
	d2.attached_node = newer_node
	d2.add_child(newer_node)
	g_container.add_child(d2)
