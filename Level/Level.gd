extends Node2D

onready var bullet_manager = $BulletManager
onready var Player_Gun_Node = $Player/Player_Gun_Node

func _ready():
	Player_Gun_Node.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
	
	
