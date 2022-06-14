extends Area2D

class_name Bullet

var speed: int
onready var spawnTimer = $Timer

var direction := Vector2.ZERO

func _init():
	speed = 2500

func _ready():
	spawnTimer.start()

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed * delta
		global_position += velocity
	
func set_direction(dir: Vector2):
	direction = dir
	rotation += direction.angle()
	
func _on_Bullet_body_entered(body):
	body.handle_bullet_entered()
	queue_free()

func _on_Timer_timeout():
	queue_free()
