extends Node2D

const bdn = preload("res://scenes/basic_damage_nodey.tscn")
const ORB = preload("res://scenes/orb.tscn")

const TICK_RATE = 60 # for 1 Tick per second
var ticker:int = 0

var tiles : Dictionary[Vector2i,Node2D] = {}
const GRID_SIZE: int = 128
var orbs : Array[Orb]  

func _ready():
	orbs = []
	

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position = get_global_mouse_position().snapped(Vector2(GRID_SIZE, GRID_SIZE))
		var pos = position / 128
		if is_open(pos):
			return
			
func _physics_process(delta: float) -> void: #runs x60 per second
	ticker += 1
	print(ticker)
	if ticker % TICK_RATE == 0:
		ticker = 0
		tick()
	for o in orbs:
		o.move()
	#also: move orbs

func tick():
	var new_orb = ORB.instantiate()
	orbs.append(new_orb)
	add_sibling(new_orb)
	
	#generate new orbs from spawner nodes
	pass
	

func is_open(pos: Vector2i) -> bool:
	return tiles.get(pos) == null
