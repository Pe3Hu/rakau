extends Area2D


@onready var cp2d = $CollisionPolygon2D
@onready var p2d = $Polygon2D

var track = null


func set_attributes(input_: Dictionary) -> void:
	track = input_.track
	position = input_.position
	init_vertexs()


func init_vertexs() -> void:
	var n = 6
	var vertexs = []
	var angle = PI * 2 / n
	
	for _i in n:
		var vertex = Vector2.from_angle(angle * _i) * Global.num.portal.r
		vertexs.append(vertex)
	
	cp2d.set_polygon(vertexs)
	p2d.set_polygon(vertexs)
	p2d.set_color(Global.color.approach.portal)


func spawn_invader() -> void:
	var input = {}
	input.track = track

	var invader = Global.scene.invader.instantiate()
	track.approach.invaders.add_child(invader)
	invader.set_attributes(input)
