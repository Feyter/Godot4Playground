extends Node3D

var next = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_end(body):
	if body.is_in_group("physics_moved_objects"):
		$FireWork.ignit()
		next += 1
		$Timer.start()


func _on_timer_timeout():
	if next == 4:
		$FireWork4.ignit()
		next += 1
		$Timer.stop()
	if next == 3:
		$FireWork2.ignit()
		next += 1
	if next == 2:
		$FireWork3.ignit()
		next += 1
