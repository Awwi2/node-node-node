class_name RelayNode
extends Nodey

func process_orb(orb:Orb):
	if (orb.direction * -1) not in ports:
		OrbManager.remove_orb(orb)
		return
	var port_in = orb.direction * -1
	var remaining_ports: Array[Vector2i] = ports.duplicate()
	remaining_ports.erase(port_in)
	for p in remaining_ports:
		generate_orb(p)
	OrbManager.remove_orb(orb)
	
func tick(tick: int):
	pass
