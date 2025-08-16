extends Node2D
class_name ballspawner
const BallType = preload("res://Assets/ball_types.gd").ball_type
const BallTypes = preload("res://Assets/ball_types.gd")
@onready var ball_type_label = get_node("../GameUI/BallTypeLabel")
@onready var balltemp= preload("res://Assets/balls.tscn")
@export var boundarybox: Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func spawnball(speed: Vector2 = Vector2.ZERO, angle: float = 0.0) -> blueBalls:

	var newball = balltemp.instantiate()

	newball.global_position = boundarybox.getspawnlocation()
	newball.linear_velocity = speed
	newball.rotation = angle

	add_child(newball)
	return newball
