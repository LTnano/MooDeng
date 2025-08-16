class_name blueBalls
extends RigidBody2D
signal yumyum

@onready var eatingBalls = $CollisionShape2D 

func yum():
	emit_signal("yumyum")

func _on_ball_detector_body_entered(body: Node2D) -> void:
	if body is mooDeng:
		yum()
		queue_free()
