extends Area2D

export (int) var speed = 200
onready var killTimer = $Timer

var direction := Vector2.ZERO

func _ready():
	killTimer.start()

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed * delta
		global_position += velocity
	
func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()


func _on_Timer_timeout():
	queue_free()
