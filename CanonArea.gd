extends Node3D

var moveVector = Vector2.ZERO
var speed = 0.25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Canon.rotate_canon(moveVector.y*PI*delta*speed, moveVector.x*PI*delta*speed)

func _on_arrwo_terminal_down_pressed():
	moveVector.y = -1

func _on_arrwo_terminal_down_released():
	moveVector.y = 0


func _on_arrwo_terminal_left_pressed():
	moveVector.x = 1


func _on_arrwo_terminal_left_released():
	moveVector.x = 0


func _on_arrwo_terminal_rigth_pressed():
	moveVector.x = -1


func _on_arrwo_terminal_rigth_released():
	moveVector.x = 0


func _on_arrwo_terminal_up_pressed():
	moveVector.y = 1


func _on_arrwo_terminal_up_released():
	moveVector.y = 0
