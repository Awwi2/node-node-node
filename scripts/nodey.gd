@abstract class_name Nodey
extends Node2D

var activated : bool = false
var pos : Vector2i
var neighbours : Array[Nodey]
var in_out_ports : Array[Vector2i] = [Vector2i.RIGHT]
const ORB = preload("uid://dhvihmtjjiwj2")


@abstract func activate(damage:float,shield:float,heal:float,other:Array, prev:Nodey)

func init_node(pos_in, ports_in):
	pos = pos_in
	in_out_ports = ports_in

func generate_orb(dir: Vector2i):
	var new_orb:Orb = ORB.instantiate()
	new_orb.init(position, dir)
	OrbManager.add_orb(new_orb) #now we never need to think about the orb ever again
	
@abstract func  process_orb(orb:Orb)
	



	
	
	
