extends CanvasLayer

signal  start_game

func show_massage(text):
	$massage.text = text
	$massage.show()
	$massage_timer.start()
	
func show_game_over():
	show_massage("Game Over")
	await $massage_timer.timeout
	
	$massage.text = "Jangan Sampai Tertangkap!!!!!!!!!"
	$massage.show()
	await get_tree().create_timer(1.0).timeout
	$start_button.show()
	
	
func update_score(score):
	$score_label.text = str(score)
	



func _on_start_button_pressed() -> void:
	$start_button.hide()
	start_game.emit()


func _on_massage_timer_timeout() -> void:
	$massage.hide()
	
	
	
