extends CharacterBody2D

var jumpbar = preload("res://progresspart.tscn")

var groundcheck = true
var speed = 150.0
const JUMP_VELOCITY = -300.0
var jumpheight = 1
var dccheck = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#Sprint
	#if Input.is_action_pressed("ui_focus_prev"):
		#speed = 200.0
	#else:
		#speed = 150.0
	
	if is_on_floor():
		GlobalVariables.playeronground = true
		
		if $jumpclock.is_stopped():
			$jumpclock.start()
	
	else:
		GlobalVariables.playeronground = false
		
		
	
	# Handle jump.
	if GlobalVariables.death == false:
		if Input.is_action_pressed("ui_select") and GlobalVariables.playeronground == true:
			$jumpclock.start()
			velocity.y = JUMP_VELOCITY * (GlobalVariables.jumpvalue + 1)
			if GlobalVariables.jumpvalue > .15:
				$jumpeffect.restart()
			GlobalVariables.jumpvalue = 0
			$jumpclock.stop()
	
	#jump boost
	#if Input.is_action_just_pressed("ui_focus_prev"):
			$jumpclock.start()
		
	#if Input.is_action_just_released("ui_focus_prev"):
			$jumpclock.stop()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
		
		if is_on_floor() != true:
			$AnimatedSprite2D.play("fall")
	
		if Input.is_action_pressed("ui_select"):
			$AnimatedSprite2D.play("jump")
		
		if direction == -1:
			if Input.is_action_pressed("ui_select") != true and is_on_floor():
				$AnimatedSprite2D.play("run")
				$AnimatedSprite2D.flip_h = true
	
		if direction == 1:
			if Input.is_action_pressed("ui_select") != true and is_on_floor():
				$AnimatedSprite2D.play("run")
				$AnimatedSprite2D.flip_h = false
	
		if direction == 0:
			if Input.is_action_pressed("ui_select") != true and is_on_floor():
				$AnimatedSprite2D.play("idle")
			$AnimatedSprite2D.flip_h = false
	
	if GlobalVariables.death == true:
		$AnimatedSprite2D.play("die")
		if $deathclock.is_stopped():
			velocity.x = GlobalVariables.boopd * 1100
			$deathclock.start()
		
	
	move_and_slide()




func _on_jumpclock_timeout():
	if GlobalVariables.jumpvalue < 0.5:
		GlobalVariables.jumpvalue += .01
		print(GlobalVariables.jumpvalue)



func _on_deathclock_timeout():
	print("alive")
	GlobalVariables.death = false
	
	
