extends Area2D

func getspawnlocation() -> Vector2:
	var shape: RectangleShape2D
	if $ballspawnarea: 
		if $ballspawnarea.shape is RectangleShape2D:
			shape = $ballspawnarea.shape 
			var size = shape.size
			var xange = randf_range(-size.x / 2, size.x / 2)
			var yange = randf_range(-size.y / 2, size.y / 2)
			var offset = Vector2(xange, yange)
			return self.global_position + offset
	return self.global_position
