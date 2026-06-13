extends Node2D

const bdn = preload("res://scenes/basic_damage_nodey.tscn")
const ORB = preload("res://scenes/orb.tscn")

const TICK_RATE = 60 # for 1 Tick per second
var ticker:int = 0

var tiles : Dictionary[Vector2i,Nodey] = {}
const GRID_SIZE: int = 32
var orbs : Array[Orb]  

var generator_node: Nodey

func _ready():
	orbs = []
	generator_node = bdn.instantiate()
	generator_node.position = Vector2(0, 64)
	tiles.set(generator_node.position, generator_node)
	add_sibling.call_deferred(generator_node)
	
	var test_node:Nodey = bdn.instantiate()
	test_node.position = Vector2(64, 64)
	test_node.in_out_ports = [Vector2i.RIGHT, Vector2i.UP]
	tiles.set(test_node.position, test_node)
	add_sibling.call_deferred(test_node)
	

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position = get_global_mouse_position().snapped(Vector2(GRID_SIZE, GRID_SIZE))
		var pos = position / 128
		if is_open(pos):
			return
			
func _physics_process(delta: float) -> void: #runs x60 per second
	ticker += 1
	OrbManager.subtick()
	if ticker % TICK_RATE == 0:
		ticker = 0
		tick()

func tick():
	#temp
	generator_node.generate_orb(Vector2i.RIGHT)
	OrbManager.tick()
	
	#generate new orbs from spawner nodes
	pass
	
func get_nodey(pos: Vector2i):
	print("someone tried to get the position" + str(pos))
	print(tiles)
	print()
	return tiles.get(pos)
func is_open(pos: Vector2i) -> bool:
	return tiles.get(pos) == null
