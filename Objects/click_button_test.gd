extends Node3D

var state = "off"
var body : RigidBody3D

func _ready():
	body = $RigidBody3D

func _physics_process(delta):
	if state == "on":
		body.apply_central_impulse(Vector3.UP*10)

func _on_click_area_3d_pressed():
	state = "on"


func _on_click_area_3d_released():
	state = "off"
