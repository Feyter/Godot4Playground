extends Control

signal go_canon
signal go_start
signal go_reset

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_canon_button_pressed():
	emit_signal("go_canon")


func _on_start_button_pressed():
	emit_signal("go_start")


func _on_reset_button_pressed():
	emit_signal("go_reset")
