extends CanvasLayer

# notifies `Main` node that the "Start" button was pressed
signal start_game


func show_message(text: String) -> void:
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
