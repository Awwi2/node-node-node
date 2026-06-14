extends Node
const DRAGGABLE_NODE = preload("uid://cuwehglyimia7")
const RELAY_NODE = preload("uid://c6ipwji5grl0y")
const PLUS_NODE = preload("uid://e0dh5t3j38u5")
const HIVEMIND_NODE = preload("uid://cqktm02qtvuql")
const PORTAL_NODE = preload("uid://d3ioqjv7fbyne")
var g_container


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	g_container = get_tree().root.get_node("/root/backpack/ScrollContainer/MarginContainer/GridContainer")
	
	add_node(RELAY_NODE, [Vector2i.LEFT, 
		Vector2i.UP])
	add_node(RELAY_NODE, [Vector2i.RIGHT, 
		Vector2i.UP])
	add_node(RELAY_NODE, [Vector2i.RIGHT, Vector2i.LEFT, 
		 Vector2i.DOWN])
	
	add_node(PLUS_NODE, [Vector2i.RIGHT, Vector2i.LEFT, 
		Vector2i.UP, Vector2i.DOWN])
	add_node(PLUS_NODE, [Vector2i.UP, Vector2i.DOWN])
	
	add_node(HIVEMIND_NODE, [Vector2i.RIGHT, Vector2i.LEFT])
	
	add_node(HIVEMIND_NODE, [Vector2i.RIGHT, Vector2i.LEFT])
	
	add_node(PORTAL_NODE, [Vector2i.RIGHT])
	
	add_node(PORTAL_NODE, [Vector2i.LEFT])

func add_node(n, ports: Array[Vector2i]) -> void:
	var d1:DraggableNode = DRAGGABLE_NODE.instantiate()
	var new_node:Nodey =  n.instantiate()
	new_node.ports = ports
	d1.attached_node = new_node
	d1.add_child(new_node)
	g_container.add_child(d1)
	
