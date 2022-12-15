extends Node3D

var isTurning = false
@export var speed = 0.1

func setOnTurning():
	isTurning = true

func setOffTurning():
	isTurning = false

func _physics_process(delta):
	if isTurning:
		self.rotate(self.basis.z, speed*PI*delta)
