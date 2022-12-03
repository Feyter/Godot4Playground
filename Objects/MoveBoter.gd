extends StaticBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var startPos
@export var Pos1 : Vector3
@export var Pos2 : Vector3
var target
var targetPos
var timer = 0.0

func _ready():
	startPos = self.position
	target = "Pos1"
	targetPos = Pos1

func _physics_process(delta):
	if self.position.distance_to(startPos+targetPos) <= 0.1:
		timer = 0
		if target == "Pos1":
			target = "Pos2"
			targetPos = Pos2
		else:
			target = "Pos1"
			targetPos = Pos1
			
	# count up timer for turn
	timer += delta*0.5
	if timer >= 1.0:
		timer = 1.0
	
	# move direction
	var direction = (startPos+targetPos - self.position).normalized()
	# move in move direction
	self.position += direction * 0.025
	
	# turn to move direction
	#self.transform = self.transform.looking_at((startPos+targetPos), Vector3.UP)
	var angleToTarget = self.basis.z.angle_to(direction)
	if abs(angleToTarget) >= 0.1:
		self.transform = self.transform.rotated_local(self.basis.y, lerp(0.0, angleToTarget, timer)).orthonormalized()
	
