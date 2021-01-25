extends State


func unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		_state_machine.transition_to("Move", {target_position = event.position})
	
