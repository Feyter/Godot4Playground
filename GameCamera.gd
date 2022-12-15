extends Camera3D

@export var target : NodePath

var followOn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if followOn:
		self.look_at(get_node(target).global_position, Vector3.UP)

func activateFollow(value):
	followOn = value
