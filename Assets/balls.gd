class_name blueBalls
extends RigidBody2D
signal yumyum

const BallTypes = preload("res://Assets/ball_types.gd")

@onready var bouncyBalls = $CollisionShape2D
@onready var eatingBalls = $BallDetector/BallDetectorShape
@onready var animated_sprite: AnimatedSprite2D = $BallSelectionBox

var my_type: int
var type_name: String

func _ready():
	# Pick a random type
	var all_types = BallTypes.ball_type.values()
	my_type = all_types[randi() % all_types.size()]
	
	# Get the string name
	type_name = BallTypes.get_ball_type_name(my_type)

	_initialise_ball_type()

func yum(ballRef: blueBalls):
	emit_signal("yumyum", ballRef)

func _on_ball_detector_body_entered(body: Node2D) -> void:
	if body is mooDeng:
		yum(self)
		queue_free()

func _initialise_ball_type():
	
	match type_name:
		"Apple":
			animated_sprite.play("Apple")
			var ballBoxScaler = Vector2(0.70, 0.70)
			var spriteScaler = Vector2(1.7, 1.7)
			animated_sprite.apply_scale(spriteScaler)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		"Blueberry":
			animated_sprite.play("Blueberry")
			var ballBoxScaler = Vector2(0.25, 0.25)
			var spriteScaler = Vector2(0.7, 0.7)
			animated_sprite.apply_scale(spriteScaler)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		"Cherry":
			animated_sprite.play("Cherry")
			var ballBoxScaler = Vector2(0.3, 0.3)
			var spriteScaler = Vector2(1, 1)
			animated_sprite.apply_scale(spriteScaler)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		"Peach":
			animated_sprite.play("Peach")
			var ballBoxScaler = Vector2(0.4, 0.4)
			var spriteScaler = Vector2(1.25, 1.25)
			animated_sprite.apply_scale(spriteScaler)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		"Watermelon":
			# give more point maybe
			animated_sprite.play("Watermelon")
			var ballBoxScaler = Vector2(1, 1)
			var spriteScaler = Vector2(2.5, 2.5)
			animated_sprite.apply_scale(spriteScaler)
			eatingBalls.apply_scale(ballBoxScaler)
			bouncyBalls.apply_scale(ballBoxScaler)
		_:
			print("Unknown ball type:", type_name)
