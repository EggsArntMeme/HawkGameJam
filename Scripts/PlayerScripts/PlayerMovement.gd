extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var public_direction = Input.get_axis("LEFT", "RIGHT")

@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("UP") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("LEFT", "RIGHT")
	get_direction()
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x < 0:
		sprite_2d.flip_h = true	
	elif velocity.x > 0:
		sprite_2d.flip_h = false

	move_and_slide()

func get_direction():
	if Input.get_axis("LEFT", "RIGHT") != 0:
		public_direction = Input.get_axis("LEFT", "RIGHT")