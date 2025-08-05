extends Node2D
class_name ballspawner
@onready var balltemp = preload("res://Assets/balls.tscn")
@export var boundarybox: Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func spawnball(speed: Vector2 = Vector2.ZERO, angle: float = 0.0):
	var newball = balltemp.instantiate() 
	#if boundarybox.has_method("getspawnlocation"):
	newball.global_position = boundarybox.getspawnlocation()
	newball.linear_velocity = speed
	newball.rotation = angle
