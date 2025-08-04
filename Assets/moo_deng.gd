extends CharacterBody2D
class_name mooDeng
@export var boundary: ArenaArea
@export var speed = 1500
@export var offset = Vector2(250, 150)
signal score_increase 
var hippo_speed = Vector2.ZERO
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	if Input.is_action_pressed("move_right"):
		hippo_speed.x += speed
		hippo_flip()
	if Input.is_action_pressed("move_left"):
		hippo_speed.x -= speed
		hippo_flip()
	if Input.is_action_pressed("move_down"):
		hippo_speed.y += speed
	if Input.is_action_pressed("move_up"):
		hippo_speed.y -= speed

	move_hippo(hippo_speed, delta)

	
	# slide backwards like michael jackson
	

func hippo_flip():
	if hippo_speed.x < 0:
		$Hippo.flip_h = true
	else:
		$Hippo.flip_h = false
		

func move_hippo(new_speed, delta):
	var test_pos = position
	test_pos += hippo_speed * delta
	test_pos = limit_boundary(test_pos)
	position = test_pos
	hippo_speed = Vector2.ZERO

func limit_boundary(pos) -> Vector2:
	if boundary:
		if pos.x < boundary.top_left.x  + offset.x:
			pos.x = boundary.top_left.x  + offset.x
		if pos.y < boundary.top_left.y  + offset.y:
			pos.y = boundary.top_left.y  + offset.y
		if pos.x > boundary.bottom_right.x  - offset.x:
			pos.x = boundary.bottom_right.x  - offset.x
		if pos.y > boundary.bottom_right.y - offset.y:
			pos.y = boundary.bottom_right.y - offset.y
		return pos
	return pos
	
	


func _on_yumyum() -> void:
	emit_signal("score_increase")
	
