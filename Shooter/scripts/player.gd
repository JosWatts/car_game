extends Area2D


@onready var laser_prefab = preload("res://prefabs/laser.tscn")
@onready var explosion_prefab = preload("res://prefabs/player_explosion.tscn")
signal player_killed

@export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if position.x > 25:
		position.x -= 1
	
	if Input.is_action_pressed('player_down') and position.y < 620:
		position.y += speed
	if Input.is_action_pressed('player_up') and position.y > 30:
		position.y -= speed
	if Input.is_action_pressed('player_right') and position.x < 480:
		position.x += speed
	if Input.is_action_pressed('player_left') and position.x > 25:
		position.x -= speed
	if Input.is_action_just_pressed("player_shoot"):
		#make a laser
		var laser = laser_prefab.instantiate()
		laser.position = position
		get_parent().add_child(laser)
		$AudioStreamPlayer.play()


func _on_body_entered(body):
	position = Vector2(128, 320)


func _on_area_entered(area):
	if area is laser:
		pass
	else:
		var player_explosion = explosion_prefab.instantiate()
		player_explosion.position = position
		get_parent().add_child(player_explosion)
		queue_free()
		area.queue_free()
		player_killed.emit()
		
