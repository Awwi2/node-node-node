class_name Orb
extends Node2D
var direction:Vector2i = Vector2i.RIGHT
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func move():
	#we want to cover the whole GRID_SIZE distance in 1 Tick
	#This method is called every subtick
	position += Vector2((direction * TileManager.GRID_SIZE) * 1/TileManager.TICK_RATE)
	
	
