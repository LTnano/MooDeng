extends Node2D
var ballConsumed
func _ready():
	var ourMooDeng = $MooDeng
	var balls = $Balls
	ballConsumed = 0
	balls.yumyum.connect(ourMooDeng._on_yumyum)
	ourMooDeng.score_increase.connect(self._onscore)

func _onscore():
	ballConsumed += 1
	$CanvasLayer/Label.set_text("Balls Consumed:" + str(ballConsumed))
func _process(delta: float) -> void:
	$Ballspawner.spawnball()
