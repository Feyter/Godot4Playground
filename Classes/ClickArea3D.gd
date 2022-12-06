extends Area3D
class_name ClickArea3D

signal pressed
signal released

var isPressed = false

func _ready():
	self.input_event.connect(on_input)
	self.mouse_exited.connect(on_exit)

func on_input(camera, event, position, normal, shape_idx):
	if event.is_action_pressed("click"):
		isPressed = true
		emit_signal("pressed")
	if event.is_action_released("click"):
		isPressed = false
		emit_signal("released")

func on_exit():
	if isPressed:
		isPressed = false
		emit_signal("released")
