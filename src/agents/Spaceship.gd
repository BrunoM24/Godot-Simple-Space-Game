extends KinematicBody2D


onready var sprite : Sprite = $Sprite

const TARGET_TRESHOULD := 8.0

export var max_speed := 500.0

var _target_position := Vector2.ZERO

var _velocity := Vector2.ZERO


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		_target_position = get_global_mouse_position()
		set_physics_process(true)


func _physics_process(delta: float) -> void:
	if global_position.distance_to(_target_position) < TARGET_TRESHOULD:
		set_physics_process(false)
		return
	
	_velocity = max_speed * (_target_position - global_position).normalized()
	
	_velocity = move_and_slide(_velocity)
	
	sprite.rotation = _velocity.angle()
