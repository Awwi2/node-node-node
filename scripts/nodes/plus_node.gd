extends Nodey


func process_orb(orb:Orb):
	if (orb.direction * -1) not in ports:
		OrbManager.remove_orb(orb)
		return
	var orb2 = orb.duplicate()
	generate_orbs(orb)
	
	queued_orbs.append(orb2)
	OrbManager.remove_orb(orb)
	
func tick(tick):
	if queued_orbs.is_empty():
		return
	elif tick == 10:
		generate_orbs(queued_orbs.pop_back())
		

func generate_orbs(orb:Orb):
	var port_in = orb.direction * -1
	var remaining_ports: Array[Vector2i] = ports.duplicate()
	remaining_ports.erase(port_in)
	for p in remaining_ports:
		generate_orb(p)
		

		
	
