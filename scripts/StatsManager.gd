extends Node

var player_max_health: int = 10
var player_health: int = 10
var player_block: int = 0

var enemy_health: int = 0
var enemy_block: int = 0
var enemy_damage: int = 0

var ui_border

func _ready():
	ui_border = get_node("/root/backpack/ui_border")
	heal(10)
	add_block(0)

func heal(amount: int):
	player_health = clamp(player_health + amount, 0, player_max_health)
	var health_label: Label = ui_border.get_node("HealthLabel")
	health_label.text = "Health: " + str(player_health)
	
func damage_player(amount: int):
	var remaining_amount = clamp(amount - player_block, 0 , 100000000)
	add_block(-amount)	
	player_health = clamp(player_health  - remaining_amount, 0, player_max_health)
	if player_health == 0:
		print("you ded")
	
	var health_label: Label = ui_border.get_node("HealthLabel")
	health_label.text = "Health: " + str(player_health)

func add_block(amount: int):
	player_block = player_block + amount
	var block_label: Label = ui_border.get_node("BlockLabel")
	block_label.text = "Block: " + str(player_block)
