extends Line2D


var approach = null
var gate = null
var portal = null


func set_attributes(input_: Dictionary) -> void:
	gate = input_.gate
	approach = gate.approach
	
	init_portal()


func init_portal() -> void:
	var input = {}
	input.track = self
	input.position = gate.position.normalized() * (Global.num.track.l + Global.num.gate.l)

	portal = Global.scene.portal.instantiate()
	approach.portals.add_child(portal)
	portal.set_attributes(input)
	add_point(gate.position)
	add_point(portal.position)
	default_color = Global.color.approach.track
	width = Global.num.track.r
