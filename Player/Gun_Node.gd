extends Node2D

signal player_fired_bullet(bullet, position, direction)

onready var Bullet_Spawn = $Bullet_Spawn
onready var Bullet_Spawn2 = $Bullet_Spawn2
onready var Gun_Timer = $Gun_Delay/Timer
onready var Reload_Timer = $Bullet_Box/ReloadTimer
onready var bullet_box = $Bullet_Box
		
func shoot(): 
	if Gun_Timer.is_stopped() and bullet_box.bullet_cylinder.size():
		var direction = (Bullet_Spawn2.global_position - Bullet_Spawn.global_position).normalized()
		emit_signal("player_fired_bullet", bullet_box.next_bullet(), Bullet_Spawn.global_position, direction)
		Gun_Timer.start()
		
func reload():
	Reload_Timer.start()
		
		
