extends Node2D
var ballConsumed
var ourMooDeng
var initialSpeed
var initialAngle

func _ready():

	ourMooDeng = $MooDeng

	ballConsumed = 0

	ourMooDeng.score_increase.connect(self._onscore)
	for i in range(15):

		# Spawn initial balls
		# This will spawn 15 balls at the start of the game
		_recalculate_spawn_parameters()
		var balls = $Ballspawner.spawnball(initialSpeed, initialAngle)

		# Connect the yumyum signal to our MooDeng instance
		balls.yumyum.connect(ourMooDeng._on_yumyum)

func _onscore():

	ballConsumed += 1
	$CanvasLayer/Label.set_text("Balls Consumed:" + str(ballConsumed))
	var balls = $Ballspawner.spawnball(initialSpeed, initialAngle)
	balls.yumyum.connect(ourMooDeng._on_yumyum)
	_recalculate_spawn_parameters()

func _process(delta: float) -> void:
	pass

func _recalculate_spawn_parameters():
	initialSpeed = Vector2(randf_range(-1000, 1000), randf_range(-1000, 1000))
	initialAngle = randf_range(0, 2 * PI)
