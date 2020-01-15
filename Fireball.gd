extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	position.x += direction * 16


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# grav is facing  forward by default
	var grav = -500
	
	position.x += direction * (15 + 2.8)
	
	if direction == -1:
		grav = 500
		
	$Fire.process_material.gravity.x = grav



func _on_Fireball_body_entered(body):
	if body.get_name() != "Player":
		queue_free()
