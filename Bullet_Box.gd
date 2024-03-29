extends Node

var bullet_source = preload("res://Player/bullets/Bullet.tscn")
var slow_bullet_source = preload("res://Player/bullets/Slow_Bullet.tscn")
var fat_bullet_source = preload("res://Player/bullets/Fat_Bullet.tscn")

var bullet_dict = {
	'Bullet': bullet_source,
	'Slow_Bullet': slow_bullet_source,
	'Fat_Bullet': fat_bullet_source,
}

var bullet_cylinder = [
	bullet_dict.Bullet.instance(), 
	bullet_dict.Slow_Bullet.instance(), 
	bullet_dict.Fat_Bullet.instance(), 
	bullet_dict.Bullet.instance(), 
	bullet_dict.Slow_Bullet.instance(), 
	bullet_dict.Fat_Bullet.instance(), 
	]
	
var spent_bullets = []
var bullet_collection = []

func _ready():
	print(bullet_cylinder.size())

func next_bullet():
	var bullet = bullet_cylinder.pop_back()
	spent_bullets.push_back(bullet.name)
	print(spent_bullets)
	return bullet


func _on_ReloadTimer_timeout():
	if bullet_collection.size():
		bullet_cylinder.push_front(bullet_collection.pop_back())
		print('reloaded.', bullet_cylinder)
	else:
		spent_bullets.shuffle()
		for bullet in spent_bullets:
			bullet_collection.push_back(bullet_dict[bullet].instance())
		spent_bullets = []
		bullet_cylinder.push_back(bullet_collection.pop_back())
		print('shuffled and ready.', bullet_cylinder)
