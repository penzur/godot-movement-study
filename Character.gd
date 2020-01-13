extends KinematicBody2D

const DAMP = 10.0
const MASS = 100.0
const GRAVITY = 200.0
const JUMP_SPEED = 1000.0
const WALK_SPEED = 90.0
const ACCELERATION = 0.2
const MAX_WALK_SPEED = 400.0

var velocity = Vector2()
var is_jumping = false
var trail: Particles2D

func _ready():
	trail = get_child(0)
	

func _physics_process(delta):
	velocity.y += delta * GRAVITY + MASS
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		is_jumping = true
		velocity.y = -JUMP_SPEED
	elif is_jumping and is_on_floor():
		is_jumping = false
	
	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	if direction != 0 or !is_on_floor():
		trail.emitting = true
	else:
		trail.emitting = false

	# check if we're not moving left or right and if we are on the floor,
	# then we decelerate
	if direction == 0 and is_on_floor():
		if velocity.x > 0:
			velocity.x -= DAMP
		elif velocity.x < 0:
			velocity.x += DAMP
		else:
			velocity.x = 0
	else:
		velocity.x += direction * (WALK_SPEED * ACCELERATION)
	
	# add extra jump height if user is long-pressing the button
	if is_jumping and Input.is_action_pressed("jump"):
		velocity.y -= GRAVITY * 0.3
	
	# add max walk speed
	velocity.x = clamp(velocity.x, -MAX_WALK_SPEED, MAX_WALK_SPEED)
	velocity = move_and_slide(velocity, Vector2(0, -1))
