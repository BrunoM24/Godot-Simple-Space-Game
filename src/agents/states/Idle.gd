extends State


func unhandled_input(event: InputEvent) -> void:
	get_parent().unhandled_input(event)


func physics_process(delta: float) -> void:
	get_parent().physics_process(delta)
