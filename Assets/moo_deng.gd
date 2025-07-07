extends CharacterBody2D

@export var speed = 1500
var screen_size

signal hit

func _ready():
	screen_size = get_viewport_rect().size
	

func _process(delta):
	var hippo_speed = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		hippo_speed.x += 1000
	if Input.is_action_pressed("move_left"):
		hippo_speed.x -= 1000
	if Input.is_action_pressed("move_down"):
		hippo_speed.y += 1000
	if Input.is_action_pressed("move_up"):
		hippo_speed.y -= 1000

	position += hippo_speed * delta
	
	if hippo_speed.x < 0:
		$Hippo.flip_h = true
	else:
		$Hippo.flip_h = false

func _on_body_entered(body):
	hide()
	hit.emit()
