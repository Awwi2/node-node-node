class_name BasicDamageNode
extends Nodey


func activate(damage:float,shield:float,heal:float,other:Array, prev:Nodey):
	damage += 1
	#instantiate orb

func process_orb(orb:Orb):
	print("processed orb")
	var port_in = orb.direction * -1
	var remaining_ports: Array[Vector2i] = in_out_ports.duplicate()
	remaining_ports.erase(port_in)
	for p in remaining_ports:
		generate_orb(p)
	OrbManager.remove_orb(orb)
	
