class_name Portal
extends Nodey

func process_orb(orb:Orb):
	if (orb.direction * -1) not in ports:
		OrbManager.remove_orb(orb)
		return
	var nodeys = TileManager.get_node_list()
	for id in nodeys:
		if nodeys[id] is Portal and nodeys[id] != self:
			nodeys[id].portal_orb()
	OrbManager.remove_orb(orb)
	
func tick(_tick):
	pass
		

func portal_orb():
	var remaining_ports: Array[Vector2i] = ports.duplicate()
	for p in remaining_ports:
		generate_orb(p)
