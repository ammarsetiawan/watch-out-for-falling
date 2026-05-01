extends Node

@export var mob_scene = preload("res://mob.tscn")

var score


func game_over() -> void:
	$HUD.show_game_over()
	$score_timer.stop()
	$mob_timer.stop()
	$dead_sound.play()
	$music.stop()

func new_game():
		score = 0
		# $Player.start($start_position.position)
		$start_timer.start()
		$Player.position = $start_position.position
		$Player.show()
		$HUD.update_score(score)
		$HUD.show_massage("get Ready")
		$music.play()
		

func _on_start_timer_timeout() -> void:
	$mob_timer.start()
	$score_timer.start()

func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = $mob_path/mob_spawn_location
	mob_spawn_location.progress_ratio = randf()
	
	mob.position = mob_spawn_location.position
	
	var direction = mob_spawn_location.rotation + PI / 2
	
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation =  direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	add_child(mob)
	
	
