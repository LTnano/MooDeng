extends CharacterBody2D

@export var speed = 1500
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	

func _process(delta):
	var hippo_speed = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		hippo_speed.x += speed
	if Input.is_action_pressed("move_left"):
		hippo_speed.x -= speed
	if Input.is_action_pressed("move_down"):
		hippo_speed.y += speed
	if Input.is_action_pressed("move_up"):
		hippo_speed.y -= speed

	position += hippo_speed * delta
	
	if hippo_speed.x < 0:
		$Hippo.flip_h = true
	else:
		$Hippo.flip_h = false
