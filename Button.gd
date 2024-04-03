extends StaticBody2D

var PRESSED = false
@onready var sprite2D = $Sprite2d


@onready var battery = get_parent().get_node("Battery") 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if PRESSED:
		sprite2D.animation = "PRESSED"
	else:
		sprite2D.animation = "UNPRESSED"

	

	pass
