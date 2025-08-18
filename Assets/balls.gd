class_name blueBalls
extends RigidBody2D
signal yumyum

const BallTypes = preload("res://Assets/ball_types.gd")

@onready var bouncyBalls = $CollisionShape2D
@onready var eatingBalls = $BallDetector/BallDetectorShape
@onready var animated_sprite: AnimatedSprite2D = $BallSelectionBox

var my_type: int

func _ready():
	# Pick a random type
	var all_types = BallTypes.ball_type.values()
	my_type = all_types[randi() % all_types.size()]
	
	# Get the string name
	var type_name = BallTypes.get_ball_type_name(my_type)

	_initialise_ball_type(type_name)

func yum():
	emit_signal("yumyum")

func _on_ball_detector_body_entered(body: Node2D) -> void:
	if body is mooDeng:
		yum()
		queue_free()

func _initialise_ball_type(type_name: String):
	
	match type_name:
		"Apple":
			animated_sprite.play("Apple")
			var ballBoxScaler = Vector2(0.5, 0.5)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		"Blueberry":
			animated_sprite.play("Blueberry")
			var ballBoxScaler = Vector2(0.3, 0.3)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		"Cherry":
			animated_sprite.play("Cherry")
			var ballBoxScaler = Vector2(0.3, 0.3)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		"Peach":
			animated_sprite.play("Peach")
			var ballBoxScaler = Vector2(0.3, 0.3)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		"Watermelon":
			animated_sprite.play("Watermelon")
			var ballBoxScaler = Vector2(1, 1)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		_:
			print("Unknown ball type:", type_name)
