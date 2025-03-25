extends Node

@export var mob_scene: PackedScene
var score


func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()


func new_game() -> void:
	score = 0
	
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")


func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	
	# choose a random location on Path2D
	var mob_spawn_locaiton = $MobPath/MobSpawnLocation
	mob_spawn_locaiton.progress_ratio = randf()
	
	mob.position = mob_spawn_locaiton.position
	
	# set mob direction perpendicular to the path direction
	var direction = mob_spawn_locaiton.rotation + PI / 2
	
	# add randomness to the direction
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# choose velocity for the mob
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	# spawn the mob
	add_child(mob)


func _on_score_timer_timeout() -> void:
	score += 1


func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
