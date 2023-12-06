extends CharacterBody2D


@onready var cp2d = $CollisionPolygon2D
@onready var p2d = $Polygon2D

var track = null
var speed = null
var direction = null


func set_attributes(input_: Dictionary) -> void:
	track = input_.track
	position = track.portal.position
	init_vertexs()


func init_vertexs() -> void:
	var n = 4
	var vertexs = []
	var angle = PI * 2 / n
	
	for _i in n:
		var vertex = Vector2.from_angle(angle * _i) * Global.num.invader.r
		vertexs.append(vertex)
	
	cp2d.set_polygon(vertexs)
	p2d.set_polygon(vertexs)
	p2d.set_color(Global.color.invader.common)
	direction = -track.gate.position.normalized()
	speed = 100


func move(delta_: float) -> void:
	var collision = move_and_collide(direction * speed * delta_)
	
	if collision:
		var a = collision.collider
		pass
		#velocity = velocity.slide(collision.normal)
