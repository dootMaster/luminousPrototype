extends KinematicBody2D

class_name Player

export (int) var speed = 100

onready var pgn = $Player_Gun_Node

func _physics_process(delta: float) ->  void:
	var movement_direction := Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		movement_direction.y = -1
	if Input.is_action_pressed("move_down"):
		movement_direction.y = 1
	if Input.is_action_pressed("move_left"):
		movement_direction.x = -1
	if Input.is_action_pressed("move_right"):
		movement_direction.x = 1
		
	movement_direction = movement_direction.normalized()
	move_and_slide(movement_direction * speed)
	
	look_at(get_global_mouse_position())
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		pgn.shoot()
	if event.is_action_pressed("reload"):
		pgn.reload()


