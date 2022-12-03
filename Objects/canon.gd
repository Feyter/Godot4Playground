extends Node3D

@export var CanonBall_Path : Resource

var ready2Fire = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area3D.input_event.connect(on_click)
	$AnimationPlayer.animation_finished.connect(fire_finish)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_click(camera, event, pos, normal, shape_idx):
	# click on canonn...
	if event.is_pressed() and ready2Fire:
		ready2Fire = false
		# fire
		var ball = load(CanonBall_Path.resource_path).instantiate()
		ball.position = $SpawnPos.position
		add_child(ball)
		ball.apply_central_impulse($SpawnPos.basis.z*-50)
		
		# Play animation
		$AnimationPlayer.play("01_fire")

func fire_finish(anim_name):
	if anim_name == "01_fire":
		ready2Fire = true
