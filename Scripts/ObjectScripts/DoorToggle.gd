extends StaticBody2D



@export var TOGGLE = false
@export var OPEN = false

var SPEED = 30

var OPEN_STATE
var CLOSE_STATE

# Called when the node enters the scene tree for the first time.
func _ready():
	if not OPEN:
		OPEN_STATE = (position.y - 64)
		CLOSE_STATE = position.y
	else:
		OPEN_STATE = position.y
		CLOSE_STATE = (position.y + 64)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("E"):
		print('E PRESSED')
		if TOGGLE:
			TOGGLE = false
		else:
			TOGGLE = true

	if TOGGLE:
		if not OPEN:
			_openDoor(delta)
		else:
			_closeDoor(delta)
	pass


func _openDoor(delta):
	if position.y >= OPEN_STATE:
		position.y += -SPEED * delta
	else:
		OPEN = true
		TOGGLE = false

func _closeDoor(delta):
	
	if position.y <= CLOSE_STATE:
		position.y += SPEED * delta
	else:
		OPEN = false
		TOGGLE = false
