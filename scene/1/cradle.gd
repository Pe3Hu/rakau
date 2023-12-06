extends MarginContainer


@onready var castle = $Castle

var sketch = null


func set_attributes(input_: Dictionary) -> void:
	sketch = input_.sketch
	
	var input = {}
	input.cradle = self
	castle.set_attributes(input)
	custom_minimum_size = Global.vec.size.approach
