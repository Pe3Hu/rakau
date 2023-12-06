extends CharacterBody2D


@onready var cp2d = $CollisionPolygon2D
@onready var p2d = $Polygon2D

var cannon = null


func set_attributes(input_: Dictionary) -> void:
	cannon = input_.cannon
	position = cannon.position
	init_vertexs()


func init_vertexs() -> void:
	var n = 3
	var vertexs = []
	var angle = PI * 2 / n
	
	for _i in n:
		var vertex = Vector2.from_angle(angle * _i) * Global.num.projectile.r
		vertexs.append(vertex)
	
	cp2d.set_polygon(vertexs)
	p2d.set_polygon(vertexs)
	p2d.set_color(Global.color.cannon.projectile)
