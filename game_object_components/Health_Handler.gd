extends Node

export (int) var max_health = 100 setget set_max_health
export (int) var current_health = max_health setget set_current_health

func set_max_health(health: int) -> void:
	max_health = max(health, 100)
	
func set_current_health(health: int) -> void:
	current_health = clamp(health, 0, max_health)

func take_damage(damage: int) -> void:
	current_health -= damage
	
func heal(heal_amount:int) -> void:
	current_health += heal_amount
