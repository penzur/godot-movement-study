extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	draw_line(Vector2(32.0, -10.0), Vector2(50.0, 0), Color.red, true)
	draw_line(Vector2(50.0, 0.0), Vector2(32.0, 10.0), Color.red, true)
	draw_line(Vector2(32.0, 10.0), Vector2(32.0, -10.0), Color.red, true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
