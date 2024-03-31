extends Area2D

var grabbed = false
var can_grab = false


# Called when the node enters the scene tree for the first time.


func _input(event):
	if Input.is_action_just_pressed("F") and can_grab and !grabbed:
		print("grabbed")
		grabbed = true
		
	if Input.is_action_just_pressed("DOWN") and grabbed:
		print("dropped")
		grabbed = false
	

func _on_body_entered(body):
	if body.name == "Player":
		can_grab = true
	


func _on_body_exited(body):
	if body.name == "Player":
		can_grab = false
