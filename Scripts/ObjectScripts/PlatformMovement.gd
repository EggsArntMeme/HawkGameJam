extends Node2D

@export var POSITION_A = 10  # first position the platform will head towards
@export var POSITION_B = -10  # second

@export var SPEED = 10

@onready var CENTRE = $Centre.position

var TOGGLE = true  # this will toggle if the platform is moving or not

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if TOGGLE:
		if CENTRE.x >= POSITION_A:
			SPEED = SPEED * -1
		elif CENTRE.x <= POSITION_B:
			SPEED = SPEED * -1

		CENTRE.x += SPEED * delta
		position.x += SPEED * delta
		
