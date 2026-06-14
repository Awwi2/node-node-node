class_name Orb
extends Node2D
var direction:Vector2i = Vector2i.RIGHT
var initial_position: Vector2 
var parent_node: Nodey #node that this Orb was spawned by 
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

func check_collision():
	if position == initial_position:
		return
	##if position.x < 11:
		#OrbManager.remove_orb(self)
		#return
	if position.x > 175:
		OrbManager.remove_orb(self)
		return
		#do attack
	elif position.y < 8:
		OrbManager.remove_orb(self)
		StatsManager.heal(1)
		return
	elif position.y > 172:
		StatsManager.add_block(1)
		OrbManager.remove_orb(self)
		return
	var node = TileManager.get_nodey(position.round()) 
	
	#if we collide, give the orb to the node, that we collided with( the colidee will delete this orb)
	if node == null or node.position == initial_position.round():
		return 

	node.process_orb(self)
	
	
