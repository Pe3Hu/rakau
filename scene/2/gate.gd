extends Area2D


@onready var cp2d = $CollisionPolygon2D
@onready var p2d = $Polygon2D


var approach = null


func set_attributes(input_: Dictionary) -> void:
	approach = input_.approach
	position = input_.position
	
	init_vertexs()


func init_vertexs() -> void:
	var n = 6
	var vertexs = []
	var angle = PI * 2 / n
	
	for _i in n:
		var vertex = Vector2.from_angle(angle * _i) * Global.num.gate.r
		vertexs.append(vertex)
	
	cp2d.set_polygon(vertexs)
	p2d.set_polygon(vertexs)
	p2d.set_color(Global.color.approach.gate)



func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_exited(body):
	pass # Replace with function body.
