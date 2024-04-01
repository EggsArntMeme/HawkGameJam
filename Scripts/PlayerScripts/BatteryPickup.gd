extends Area2D

var grabbed = false
var can_grab = false



@onready var PLAYER = get_parent().get_parent().get_node("Player")  # grabs the "Player" from the level scene (will crash if none I imagine)
@onready var SELF = get_parent()  # this grabs the rigid body of the box
# had to do due to where this script is located ^
# Called when the node enters the scene tree for the first time.

func _process(_delta):
	if grabbed:
		SELF.position.x = PLAYER.position.x
		SELF.position.y = PLAYER.position.y - 30



func _input(_event):
	if Input.is_action_just_pressed("F") and can_grab and !grabbed:
		print("grabbed")
		SELF.gravity_scale = 0
		grabbed = true
		
	if Input.is_action_just_pressed("DOWN") and grabbed:
		print("dropped")
		SELF.gravity_scale = 1
		grabbed = false
		SELF.position.x = PLAYER.position.x + (30 * PLAYER.public_direction)
		SELF.position.y = PLAYER.position.y - 10
		can_grab = true
	

func _on_body_entered(body):
	if body.name == "Player":
		can_grab = true
	


func _on_body_exited(body):
	if body.name == "Player":
		can_grab = false
