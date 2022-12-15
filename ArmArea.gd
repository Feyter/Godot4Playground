extends Node3D

signal followOn

var pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_anim_terminal_button_button_pushed_down():
	if !pressed:
		pressed = true
		$Bumper.push()
		$RoboArm.tap()
		$WindArea.blow()
		$Wheel.setOnTurning()
		emit_signal("followOn")


func _on_end_area_body_entered(body):
	if pressed and body.is_in_group("physics_moved_objects"):
		$RoboArm.stop()
		$WindArea.stopBlow()
