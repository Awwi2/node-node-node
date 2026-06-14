@abstract class_name Nodey
extends Node2D

var activated : bool = false
var pos : Vector2i
var neighbours : Array[Nodey]
var ports : Array[Vector2i] = [Vector2i.RIGHT]

var queued_orbs: Array[Orb] = []
const ORB = preload("uid://dhvihmtjjiwj2")

func _ready():
	$Pipes.set_pipes(ports)

func init_node(pos_in, ports_in):
	pos = pos_in
	ports = ports_in

func generate_orb(dir: Vector2i):
	var new_orb:Orb = ORB.instantiate()
	new_orb.init(global_position, dir)
	OrbManager.add_orb(new_orb) #now we never need to think about the orb ever again
	
@abstract func process_orb(orb:Orb)

@abstract func tick(tick:int)
	



	
	
	
