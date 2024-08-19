extends Area2D
var drection = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$GPUParticles2D.restart()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= drection


func _on_body_entered(body):
	if body.name == "realplayer":
		GlobalVariables.death = true
		
		GlobalVariables.boopd = drection
		if GlobalVariables.boopd == 1:
			GlobalVariables.boopd = -1
		else:
			GlobalVariables.boopd = 1
	
	else:
		get_rotation_degrees()
		print('checkwall')
		print(rotation_degrees)
		if rotation_degrees > 89 and rotation_degrees < 91:
			print("turn")
			set_rotation_degrees(-90)
			drection = -1
			
		else: 
			if rotation_degrees > -89 and rotation_degrees < -91 or rotation_degrees == -90:
				print("turn3")
				set_rotation_degrees(90)
				drection = 1
