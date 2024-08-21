extends Node2D

@export var bug_scene : PackedScene
var score


func game_over() -> void:
	$BugTimer.stop()
	$ScoreTimer.stop()
	
func new_game():
	$StartTimer.start()
