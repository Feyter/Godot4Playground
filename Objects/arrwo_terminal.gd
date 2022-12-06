extends Node3D

signal up_pressed
signal up_released

signal down_pressed
signal down_released

signal left_pressed
signal left_released

signal rigth_pressed
signal rigth_released

func _ready():
		$ArrowTerminal/AnimationPlayer.play("00_null")


func _on_click_up_pressed():
	emit_signal("up_pressed")
	$ArrowTerminal/AnimationPlayer.play("01_press_up")


func _on_click_up_released():
	emit_signal("up_released")
	$ArrowTerminal/AnimationPlayer.play_backwards("01_press_up")


func _on_clickeft_pressed():
	emit_signal("left_pressed")
	$ArrowTerminal/AnimationPlayer.play("02_push_left")


func _on_clickeft_released():
	emit_signal("left_released")
	$ArrowTerminal/AnimationPlayer.play_backwards("02_push_left")


func _on_click_rigth_pressed():
	emit_signal("rigth_pressed")
	$ArrowTerminal/AnimationPlayer.play("04_push_rigth")


func _on_click_rigth_released():
	emit_signal("rigth_released")
	$ArrowTerminal/AnimationPlayer.play_backwards("04_push_rigth")


func _on_click_down_pressed():
	emit_signal("down_pressed")
	$ArrowTerminal/AnimationPlayer.play("03_push_down")


func _on_click_down_released():
	emit_signal("down_released")
	$ArrowTerminal/AnimationPlayer.play_backwards("03_push_down")
