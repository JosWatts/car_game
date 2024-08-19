extends Node2D

@onready var enemy_prefab = preload("res://prefabs/enemy_1.tscn")

var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	_update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_timer_timeout():
	var enemy = enemy_prefab.instantiate()
	var random_y = randi_range(30, 610)
	enemy.position = Vector2(1200,random_y)
	enemy.enemy_killed.connect(_on_enemy_killed)
	add_child(enemy)

func _update_ui():
	$game_ui/score_label.text = "Score " + str(score)
	

func _on_enemy_killed():
	score += 25
	_update_ui()


func _on_player_player_killed():
	#start timer
	$restart.start()


func _on_restart_timeout():
	get_tree().reload_current_scene()


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()

func _on_new_wave():
	print("chees")
