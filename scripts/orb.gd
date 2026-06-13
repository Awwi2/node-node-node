class_name Orb
extends Node2D
var direction:Vector2i = Vector2i.RIGHT
var initial_position: Vector2 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func init(pos:Vector2, dir:Vector2i):
	position = pos
	direction = dir
	initial_position = pos
	
func move():
	#we want to cover the whole GRID_SIZE distance in 1 Tick
	#This method is called every subtick
	position += Vector2((direction * TileManager.GRID_SIZE) * 1.0/TileManager.TICK_RATE)
	#check for collision with a node

func check_collision():
	if position == initial_position:
		return
	var node = TileManager.get_nodey(position.round()) 
	#if we collide, give the orb to the node, that we collided with( the colidee will delete this orb)
	if node == null:
		return 
	node.process_orb(self)
	
	
