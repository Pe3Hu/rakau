extends Area2D


@onready var cp2d = $CollisionPolygon2D
@onready var p2d = $Polygon2D

var gate = null
var direction = null


func set_attributes(input_: Dictionary) -> void:
	gate = input_.gate
	position = gate.position
	
	init_vertexs()


func init_vertexs() -> void:
	var n = 6
	var vertexs = []
	var angle = PI * 2 / n
	
	for _i in n:
		var vertex = Vector2.from_angle(angle * _i) * Global.num.cannon.r
		vertexs.append(vertex)
	
	cp2d.set_polygon(vertexs)
	p2d.set_polygon(vertexs)
	p2d.set_color(Global.color.approach.cannon)
	direction = gate.position.normalized()

