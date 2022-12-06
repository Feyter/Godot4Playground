extends Node3D

@export var CanonBall_Path : Resource

var ready2Fire = true
var spriteVisible = true
var target = Vector3.ZERO
var canonAmature : Node3D

var canon_start_forward : Vector3
var stand_start_forward : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area3D.input_event.connect(on_click)
	target = $CanonMesh/CanonArmature.basis.z
	canonAmature = $CanonMesh/CanonArmature
	canon_start_forward = $CanonMesh/CanonArmature.global_transform.basis.z
	stand_start_forward = $CanonMesh.global_transform.basis.z

# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_click(camera, event, pos, normal, shape_idx):
	# click on canonn...
	if event.is_pressed() and ready2Fire:
		#first click remove sprite
		if spriteVisible:
			spriteVisible = false
			$Sprite3D/SpriteAP.play("Fade_Out")
		
		ready2Fire = false
		# fire
		var ball = load(CanonBall_Path.resource_path).instantiate()
		ball.position = $CanonMesh/CanonArmature/SpawnPos.global_position-self.position
		add_child(ball)
		ball.apply_central_impulse($CanonMesh/CanonArmature.global_transform.basis.z*-50)
		
		# Play animation
		$CanonMesh/AnimationPlayer.play("Fire")

func fire_finish(anim_name):
	if anim_name == "Fire":
		ready2Fire = true

func rotate_canon(xAngle, yAngle):
	# limit up/down rotation
	if canonAmature.rotation.x+xAngle < PI/4 and canonAmature.rotation.x+xAngle > -PI/9:
		canonAmature.rotate(canonAmature.basis.x, xAngle)
	
	# limit left/rigth rotation
	if $CanonMesh.rotation.y+yAngle < PI/3 and $CanonMesh.rotation.y+yAngle > -PI/3:
		$CanonMesh.rotate(Vector3.UP, yAngle)
	
	#limit rotation of UP/Down to max PI/4
	#if canonAmature.global_transform.basis.z.angle_to(canon_start_forward) + xAngle <= PI/4 and canonAmature.global_transform.basis.z.angle_to(canon_start_forward) + xAngle >= -PI/4:
		#canonAmature.basis = canonAmature.basis.rotated($CanonMesh.basis.x, xAngle).orthonormalized()
	# limit rotation of left/rigth to max PI/4
	#if $CanonMesh.global_transform.basis.z.angle_to(stand_start_forward) + zAngle <= PI/4 and $CanonMesh.global_transform.basis.z.angle_to(stand_start_forward) + zAngle >= -PI/4:
		#$CanonMesh.basis = $CanonMesh.basis.rotated(Vector3.UP, zAngle).orthonormalized()
