extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Ready")

func _on_body_entered(body):
	if "Player" in body.name:
		print(body.name + " can now pick the battery up!" )
