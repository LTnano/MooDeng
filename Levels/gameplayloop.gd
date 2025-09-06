extends Node2D

const BallTypes = preload("res://Assets/ball_types.gd")
const playerEnum = preload("res://Assets/player_enum.gd")

var initialSpeed
var initialAngle

var dengArray = []
var scores = []

@export var numberOfPlayers: int = clamp(4, 1, 4)
@onready var playerTemp= preload("res://Assets/MooDeng.tscn")
@onready var score_labels = [$CanvasLayer/ScoreContainer/ScoreLabel1,
							$CanvasLayer/ScoreContainer/ScoreLabel2,
							$CanvasLayer/ScoreContainer/ScoreLabel3,
							$CanvasLayer/ScoreContainer/ScoreLabel4]

func _ready():
	for each in range(numberOfPlayers):
		var newDeng = playerTemp.instantiate()
		# make deng spawn better
		newDeng.position += Vector2(each*100, each*100)
		newDeng.player_number = each
		add_child(newDeng)
		dengArray.append(newDeng)


	scores.clear()
	for i in range(numberOfPlayers):
		scores.append(0)

	for each in dengArray:
		each.score_increase.connect(self._onscore)

	for i in range(15):
		# Spawn initial balls
		# This will spawn 15 balls at the start of the game
		_recalculate_spawn_parameters()
		var balls = $Ballspawner.spawnball(initialSpeed, initialAngle)

		# Connect the yumyum signal to each MooDeng instance
		for deng in dengArray:
			balls.yumyum.connect(deng._on_yumyum)

func _onscore(player_number: int, ballRef: blueBalls):
	match ballRef.type_name:
		"Apple":
			scores[player_number] += 1
		"Blueberry":
			scores[player_number] += 3
		"Cherry":
			scores[player_number] += 2
		"Peach":
			scores[player_number] += 1
		"Watermelon":
			scores[player_number] += 5
		_:
			scores[player_number] += 1
	# Update the UI for this player here
	score_labels[player_number].text = str(scores[player_number])
	var balls = $Ballspawner.spawnball(initialSpeed, initialAngle)
	for deng in dengArray:
		balls.yumyum.connect(deng._on_yumyum)
	_recalculate_spawn_parameters()

func _process(delta: float) -> void:
	pass

func _recalculate_spawn_parameters():
	initialSpeed = Vector2(randf_range(-1000, 1000), randf_range(-1000, 1000))
	initialAngle = randf_range(0, 2 * PI)
