extends Node2D


@onready var tracks = $Tracks
@onready var gates = $Gates
@onready var portals = $Portals
@onready var cannons = $Cannons
@onready var projectiles = $Projectiles
@onready var invaders = $Invaders

var castle = null


func set_attributes(input_: Dictionary) -> void:
	castle = input_.castle
	
	init_gates()
	init_tracks()
	init_cannons()
	init_invaders()


func init_gates() -> void:
	var n = 6
	var angle = PI * 2 / n
	
	for _i in n:
		var input = {}
		input.approach = self
		input.position = Vector2.from_angle(angle * _i) * Global.num.gate.l
	
		var gate = Global.scene.gate.instantiate()
		gates.add_child(gate)
		gate.set_attributes(input)


func init_tracks() -> void:
	for gate in gates.get_children():
		var input = {}
		input.gate = gate
	
		var track = Global.scene.track.instantiate()
		tracks.add_child(track)
		track.set_attributes(input)


func init_cannons() -> void:
	for gate in gates.get_children():
		var input = {}
		input.gate = gate
	
		var cannon = Global.scene.cannon.instantiate()
		cannons.add_child(cannon)
		cannon.set_attributes(input)


func init_invaders() -> void:
	for portal in portals.get_children():
		portal.spawn_invader()


func _physics_process(_delta: float) -> void:
	for invader in invaders.get_children():
		invader.move(_delta)
