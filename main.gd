extends Node

@export var mob_scene: PackedScene
var score


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()


func new_game() -> void:
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()


func _on_mob_timer_timeout() -> void:
	pass


func _on_score_timer_timeout() -> void:
	pass


func _on_start_timer_timeout() -> void:
	pass
