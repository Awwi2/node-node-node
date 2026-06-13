extends Nodey

func _init() -> void:
	ports = [Vector2i(1,0)]
	pos = Vector2i(0,0)

func activate(damage:float,shield:float,heal:float,other:Array, prev:Nodey):
	damage += 1
	#instantiate orb
