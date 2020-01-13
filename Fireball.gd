extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x += 15 + 2.8



func _on_Fireball_body_entered(body):
	if body.get_name() != "Player":
		queue_free()
