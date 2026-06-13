extends Node

var orbs: Array[Orb] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func add_orb(orb: Orb):
	orbs.append(orb)
	add_child(orb)

func remove_orb(orb: Orb):
	orbs.erase(orb)
	orb.queue_free()

func subtick(): # handles all of the orb movement and orb collision detection
	for o in orbs: 
		o.move()
		
func tick():
	for o in orbs:
		o.check_collision()
