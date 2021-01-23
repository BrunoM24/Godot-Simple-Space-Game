extends Node2D


onready var animation_player : AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	visible = true


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		global_position = get_global_mouse_position()
		animation_player.play("fade_out")
