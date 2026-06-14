extends Node2D

const OFFSET_X = 13
const OFFSET_Y = 10

const RELAY = preload("res://scenes/nodes/relay_node.tscn")
const PLUS_NODE = preload("uid://e0dh5t3j38u5")

const ORB = preload("res://scenes/orb.tscn")

const TICK_RATE = 30 # for 1 Tick per second
var ticker:int = 0

var tiles : Dictionary[Vector2i,Nodey] = {}
const GRID_SIZE: int = 16
var orbs : Array[Orb]  

var generator_node: Nodey

var finish_setup_button:Button 

func _ready():
	var b1: TextureButton = get_node("/root/backpack/ui_border/SpawnButton1")
	var b2: TextureButton = get_node("/root/backpack/ui_border/SpawnButton2")
	var b3: TextureButton = get_node("/root/backpack/ui_border/SpawnButton3")
	var b4: TextureButton = get_node("/root/backpack/ui_border/SpawnButton4")
	var b5: TextureButton = get_node("/root/backpack/ui_border/SpawnButton5")
	var b6: TextureButton = get_node("/root/backpack/ui_border/SpawnButton6")
	var b7: TextureButton = get_node("/root/backpack/ui_border/SpawnButton7")
	var b8: TextureButton = get_node("/root/backpack/ui_border/SpawnButton8")
	var b9: TextureButton = get_node("/root/backpack/ui_border/SpawnButton9")
	var b10: TextureButton = get_node("/root/backpack/ui_border/SpawnButton10")
	finish_setup_button = get_node("/root/backpack/ui_border/NinePatchRect/FinishSetupButton")
	
	b1.pressed.connect(_on_spawn_button1_pressed)
	b2.pressed.connect(_on_spawn_button2_pressed)
	b3.pressed.connect(_on_spawn_button3_pressed)
	b4.pressed.connect(_on_spawn_button4_pressed)
	b5.pressed.connect(_on_spawn_button5_pressed)
	b6.pressed.connect(_on_spawn_button6_pressed)
	b7.pressed.connect(_on_spawn_button7_pressed)
	b8.pressed.connect(_on_spawn_button8_pressed)
	b9.pressed.connect(_on_spawn_button9_pressed)
	b10.pressed.connect(_on_spawn_button10_pressed)
	
	b1.disabled = true
	b2.disabled = true
	b3.disabled = true
	b4.disabled = true
	b5.disabled = true
	b6.disabled = true
	b7.disabled = true
	b8.disabled = true
	b9.disabled = true
	b10.disabled = true
	finish_setup_button.pressed.connect(_on_finish_setup_button_pressed)
	orbs = []
	
	#var test_node:Nodey = RELAY.instantiate()
	#test_node.position = Vector2(16*1+21, 16*3+18)
	#test_node.ports = [Vector2i.LEFT,Vector2i.RIGHT, Vector2i.UP]
	#tiles.set(test_node.position, test_node)
	#add_sibling.call_deferred(test_node)
	#
	#var plus_node:Nodey = PLUS_NODE.instantiate()
	#plus_node.position = Vector2(16*3+21,16*3+18)
	#plus_node.ports = [Vector2i.LEFT, Vector2i.RIGHT]
	##plus_node.init_node(Vector2(128, 64), [Vector2i.LEFT, Vector2i.DOWN])
	#tiles.set(plus_node.position, plus_node)
	#add_sibling.call_deferred(plus_node)
	

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position = get_global_mouse_position().snapped(Vector2(GRID_SIZE, GRID_SIZE))
		var pos = position / 128
		if is_open(pos):
			return
			
func _physics_process(delta: float) -> void: #runs x60 per second
	ticker += 1
	OrbManager.subtick()
	for t in tiles.values():
		t.tick(ticker)
	if ticker % TICK_RATE == 0:
		ticker = 0
		tick()

func tick():
	#temp
	#generator_node.generate_orb(Vector2i.RIGHT)
	OrbManager.tick()
	
	#generate new orbs from spawner nodes
	pass
	
func get_nodey(pos: Vector2i):
	return tiles.get(pos)
func is_open(pos: Vector2i) -> bool:
	return tiles.get(pos) == null
func _on_spawn_button1_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton1").position
		spawn_button_orb(button_pos)
func _on_spawn_button2_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton2").position
		spawn_button_orb(button_pos)
func _on_spawn_button3_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton3").position
		spawn_button_orb(button_pos)
func _on_spawn_button4_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton4").position
		spawn_button_orb(button_pos)
func _on_spawn_button5_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton5").position
		spawn_button_orb(button_pos)
func _on_spawn_button6_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton6").position
		spawn_button_orb(button_pos)
func _on_spawn_button7_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton7").position
		spawn_button_orb(button_pos)
func _on_spawn_button8_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton8").position
		spawn_button_orb(button_pos)
func _on_spawn_button9_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton9").position
		spawn_button_orb(button_pos)
func _on_spawn_button10_pressed():
	if Globals.finished_setup:
		var button_pos = get_node("/root/backpack/ui_border/SpawnButton10").position
		spawn_button_orb(button_pos)
		
	
func spawn_button_orb(button_pos):
	var new_orb:Orb = ORB.instantiate()
	new_orb.init(button_pos + Vector2(2,4), Vector2i.RIGHT)
	OrbManager.add_orb(new_orb)
	
func create_node(pos: Vector2, node_type: String):
	var new_node: Nodey
	match node_type:
		"Relay":
			new_node = RELAY.instantiate()
		"Plus":
			new_node = PLUS_NODE.instantiate()
	
	if new_node == null:
		push_error(str(node_type) + " is  an invalid node type!!! ")
		return
	new_node.position = pos
	new_node.ports = [Vector2i.LEFT,Vector2i.RIGHT, Vector2i.UP]
	tiles.set(new_node.position, new_node)
	add_sibling.call_deferred(new_node)
	return new_node

func remove_node(node:Nodey):
	print(tiles)
	print("trying to remove: " + str(Vector2i(node.global_position)))
	if not tiles.erase(Vector2i(node.global_position)):
		print("uh oh")
	#node.queue_free.call_deferred()
	
func add_node(node:Nodey):
	print("called with")
	print(node)
	tiles.set(node.global_position, node)
	print("placed at : " + str(node.global_position))
	
func _on_finish_setup_button_pressed():
	finish_setup_button.get_parent().visible = false
	get_node("/root/backpack/ScrollContainer").visible = false
	Globals.finished_setup = true
	var b1: TextureButton = get_node("/root/backpack/ui_border/SpawnButton1")
	var b2: TextureButton = get_node("/root/backpack/ui_border/SpawnButton2")
	var b3: TextureButton = get_node("/root/backpack/ui_border/SpawnButton3")
	var b4: TextureButton = get_node("/root/backpack/ui_border/SpawnButton4")
	var b5: TextureButton = get_node("/root/backpack/ui_border/SpawnButton5")
	var b6: TextureButton = get_node("/root/backpack/ui_border/SpawnButton6")
	var b7: TextureButton = get_node("/root/backpack/ui_border/SpawnButton7")
	var b8: TextureButton = get_node("/root/backpack/ui_border/SpawnButton8")
	var b9: TextureButton = get_node("/root/backpack/ui_border/SpawnButton9")
	var b10: TextureButton = get_node("/root/backpack/ui_border/SpawnButton10")

	b1.disabled = false
	b2.disabled = false
	b3.disabled = false
	b4.disabled = false
	b5.disabled = false
	b6.disabled = false
	b7.disabled = false
	b8.disabled = false
	b9.disabled = false
	b10.disabled = false

	
	
	
