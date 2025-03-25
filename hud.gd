extends CanvasLayer

# notifies `Main` node that the "Start" button was pressed
signal start_game


func show_message(text: String) -> void:
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over() -> void:
	show_message("Game Over")
	await $MessageTimer.timeout
	
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	# wait for a second
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
