extends KinematicBody2D


const TARGET_TRESHOULD := 8.0

export var max_speed := 500.0
export var mass := 2.0
export var slow_radius := 200.0

var _target_position := Vector2.ZERO

var _velocity := Vector2.ZERO


func _ready() -> void:
	set_physics_process(false)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		_target_position = get_global_mouse_position()
		set_physics_process(true)


func _physics_process(delta: float) -> void:
	var distance_to_target := global_position.distance_to(_target_position)
	
	if distance_to_target < TARGET_TRESHOULD:
		set_physics_process(false)
		return
	
	var desired_velocity := max_speed * (_target_position - global_position).normalized()
	
	if distance_to_target < slow_radius:
		desired_velocity *= (distance_to_target / slow_radius)
	
	var steering := (desired_velocity - _velocity) / mass
	
	_velocity = _velocity + steering
	
	_velocity = move_and_slide(_velocity)
	
	rotation = _velocity.angle()
