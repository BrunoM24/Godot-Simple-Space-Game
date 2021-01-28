extends State


const TARGET_TRESHOULD := 8.0

export var max_speed := 700.0
export var mass := 10.0
export var slow_radius := 400.0

var _start_position := Vector2.ZERO
var _target_position := Vector2.ZERO

var _velocity := Vector2.ZERO


func unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		_start_position = _target_position
		_target_position = event.position


func physics_process(delta: float) -> void:
	if _target_position == _start_position:
		return
	
	var distance_to_target : float = owner.global_position.distance_to(_target_position)
	
	if distance_to_target < TARGET_TRESHOULD:
		var t = _target_position
		_target_position = _start_position
		_start_position = t
	
	var desired_velocity : Vector2 = max_speed * (_target_position - owner.global_position).normalized()
	
	if distance_to_target < slow_radius:
		desired_velocity *= (distance_to_target / slow_radius)
	
	var steering := (desired_velocity - _velocity) / mass
	
	_velocity = _velocity + steering
	
	_velocity = owner.move_and_slide(_velocity)
	
	owner.rotation = _velocity.angle()


func enter(msg: Dictionary = {}) -> void:
	_start_position = owner.global_position
	
	if msg.has("target_position"):
		_target_position = msg.target_position
	else:
		_target_position = _start_position


func exit() -> void:
	_target_position = owner.global_position
	_velocity = Vector2.ZERO
