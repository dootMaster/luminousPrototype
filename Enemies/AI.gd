extends Node2D

signal state_changed(new_state)

enum Enemy_State {
	PATROL,
	ENGAGE,
}

onready var detection_zone = $Detection_Zone

var current_state = Enemy_State.PATROL setget set_state
var player: Player = null
var weapon = null

func _process(delta):
	match current_state:
		Enemy_State.PATROL:
			pass
		Enemy_State.ENGAGE:
			if player and weapon:
				weapon.shoot()
			else:
				print('no player or weapon')
		_:
			print('non-existent state passed')

func set_state(new_state: int) -> void:
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal("state_changed", current_state)

func _on_Detection_Zone_body_entered(body):
	if body.is_in_group("player"):
		set_state(Enemy_State.ENGAGE)
		player = body
		
func initialize_weapon(weapon): #dependency injection function invoked from Enemy:root
	self.weapon = weapon
