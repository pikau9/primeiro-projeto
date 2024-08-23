extends Node2D

@export var bug_scene : PackedScene
var score = 0

func _ready():
	new_game()

func game_over():
	$BugTimer.stop()
	$ScoreTimer.stop()
	# Adicione outras operações de final de jogo, se necessário

func new_game():
	$StartTimer.start()
	$player.start_pos($StartPosition.position)
	score = 0

func _on_score_timer_timeout():
	score += 1

func _on_start_timer_timeout():
	$BugTimer.start()
	$ScoreTimer.start()

func _on_bug_timer_timeout():
	var bug = bug_scene.instantiate()
	var bug_location = $BugPath/BugPathLocation
	bug.position = bug_location.position  # Define a posição do bug

	var direction = bug_location.rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	bug.rotation = direction

	if bug is RigidBody2D:
		var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
		bug.linear_velocity = velocity.rotated(direction)
	else:
		# Se bug não for um RigidBody2D, você precisa definir a lógica de movimento de outra forma
		pass

	add_child(bug)
