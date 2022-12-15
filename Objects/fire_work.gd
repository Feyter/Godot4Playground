extends Node3D

enum STATE {
	waiting,
	ignited,
	exploded
}

var burnTimer = 0
var particle_mesh : Mesh

var state = STATE.waiting

var particle_color = Vector4(1.0, 0.0, 0.0, 1.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	particle_mesh = $ExplosionParticlesGPU.get_draw_pass_mesh(0)
	particle_color = makeColor()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == STATE.ignited:
		self.position += self.basis.y*delta*10
	
	if state == STATE.exploded:
		if burnTimer <= 1:
			burnTimer += delta
		else:
			burnTimer = 1
		particle_mesh.surface_get_material(0).set_shader_parameter("color", particle_color*(1-burnTimer))


func _on_explosion_timer_timeout():
	state = STATE.exploded
	$TrailParticleGPU.emitting = false
	$ExplosionParticlesGPU.restart()

func ignit():
	state = STATE.ignited
	$ExplosionTimer.start()
	$TrailParticleGPU.restart()

func makeColor():
	var firstColor = randf()
	var secondColor = (1.0-firstColor) * (1.0-randf())
	var thirdColor = 1.0-(secondColor+firstColor)
	
	return Vector4(firstColor, secondColor, thirdColor, 1.0)
