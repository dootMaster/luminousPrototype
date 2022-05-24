extends KinematicBody2D

signal player_fired_bullet(bullet, position, direction)

export(PackedScene) var Bullet
export (int) var speed = 100

onready var Bullet_Spawn = $Bullet_Spawn
onready var Bullet_Spawn2 = $Bullet_Spawn2
onready var Bullet_Box = $Bullet_Box
onready var Reload_Timer = $Bullet_Box/ReloadTimer



func _process(delta: float) ->  void:
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
		shoot()
	if event.is_action_pressed("reload"):
		reload()
		
func shoot(): 
	var bullet_instance = Bullet_Box.next_bullet()
	if bullet_instance:
		print("bullets left: ", Bullet_Box.bullet_cylinder.size())
		var direction = (Bullet_Spawn2.global_position - Bullet_Spawn.global_position).normalized()
		emit_signal("player_fired_bullet", bullet_instance, Bullet_Spawn.global_position, direction)
		
func reload():
	if Reload_Timer.is_stopped() and Bullet_Box.bullet_cylinder.size() < 6:
		print("reloading...")
		Reload_Timer.start()
