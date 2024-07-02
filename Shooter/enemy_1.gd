extends Area2D
class_name enemy_ship
@onready var explosion_prefab = preload("res://prefabs/explosion.tscn")
@onready var laser_prefab = preload("res://prefabs/enemy_laser.tscn")
@export var speed = 5
var wave_counter = 0
signal enemy_killed
signal new_wave
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed


func _on_area_entered(area):
	if area is laser:
		var explosion = explosion_prefab.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)
		queue_free()
		area.queue_free()
		enemy_killed.emit()
		wave_counter += 25
		if wave_counter == 25:
			print("first")
			wave_counter = 0
			new_wave.emit()


func _on_laser_spawn_timer_timeout():
	var laser = laser_prefab.instantiate()
	laser.position = position
	get_parent().add_child(laser)
	
func _on_new_wave():
	print("l")
