extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	$jumpbar.value = (GlobalVariables.jumpvalue + 0.13)

	#if $jumpbar.value  == 0.01:
		#$jumpbar.value += 0.13
	
	#if $jumpbar.value == 0:
		#$jumpbar.value += 0.13
	#if $jumpbar.value == 200:
		#$jumpbartimer.stop()
	#if Input.is_action_just_pressed("ui_focus_prev"): #and GlobalVariables.playeronground == true:
		#$jumpbartimer.start()
	#if Input.is_action_just_released("ui_focus_prev"): #and GlobalVariables.playeronground == true:
		#$jumpbartimer.stop()
		#$jumpbar.value = GlobalVariables.jumpvalue

#func _on_timer_timeout():
	#$jumpbar.value+=GlobalVariables.jumpvalue
	
#func _barfill():
	#if Input.is_action_just_pressed("ui_focus_prev") and $realplayer.is_on_floor():
		#$jumpbartimer.start()
	
