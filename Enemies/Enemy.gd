extends KinematicBody2D

onready var weapon = $Gun_Node
onready var ai = $AI

func _ready() -> void:
	ai.initialize_weapon(weapon)

func handle_bullet_entered() -> void:
	print('hit')
