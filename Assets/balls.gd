class_name blueBalls
extends RigidBody2D
signal yumyum

const BallTypes = preload("res://Assets/ball_types.gd")

@onready var eatingBalls = $CollisionShape2D
@onready var animated_sprite: AnimatedSprite2D = $BallSelectionBox

var my_type: int

func _ready():
	# Pick a random type
	var all_types = BallTypes.ball_type.values()
	my_type = all_types[randi() % all_types.size()]
	
	# Get the string name
	var type_name = BallTypes.get_ball_type_name(my_type)
	
	# Check if animation exists in the SpriteFrames resource and play
	var frames_resource = animated_sprite.sprite_frames
	if frames_resource and frames_resource.has_animation(type_name):
		animated_sprite.animation = type_name
		animated_sprite.play()
	else:
		print("No animation found for type:", type_name)

func yum():
	emit_signal("yumyum")

func _on_ball_detector_body_entered(body: Node2D) -> void:
	if body is mooDeng:
		yum()
		queue_free()
