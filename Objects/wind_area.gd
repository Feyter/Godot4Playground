extends Node3D

@export var direction : Vector3

var bodiesOnBeld = Array()
var isBlowing = false

func blow():
	isBlowing = true
	$Fan/AnimationPlayer.play("01_rotate", -1, 2.0)

func stopBlow():
	isBlowing = false
	$Fan/AnimationPlayer.play("00_null", 0.2)

# Checks if the endered Body should be added to the array of objects on the belt
func checkForAddBody(body):
	if body.is_in_group("physics_moved_objects"):
		bodiesOnBeld.push_back(body)

func ceckForRemoveBody(body):
	if bodiesOnBeld.has(body):
		bodiesOnBeld.remove_at(bodiesOnBeld.find(body))

func _on_area_3d_body_entered(body):
	checkForAddBody(body)

func _on_area_3d_body_exited(body):
	ceckForRemoveBody(body)


func _physics_process(delta):
	if isBlowing:
		for i in bodiesOnBeld.size():
			var body : RigidBody3D = bodiesOnBeld[i]
			var forcePos = bodiesOnBeld[i].position-Vector3(0, 0.5, 0)
			body.apply_central_impulse(direction)
