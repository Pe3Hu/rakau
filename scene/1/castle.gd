extends MarginContainer


@onready var approach = $Approach


var cradle = null


func set_attributes(input_: Dictionary) -> void:
	cradle = input_.cradle

	var input = {}
	input.castle = self
	approach.set_attributes(input)
	custom_minimum_size = Vector2(Global.vec.size.approach)
	approach.position = Vector2(Global.vec.size.approach) * 0.5
