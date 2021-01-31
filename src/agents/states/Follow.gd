extends State


const TARGET_TRESHOULD := 4.0

export var slow_radius := 200.0

var _target_position := Vector2.ZERO

var _velocity := Vector2.ZERO

export var avoidance_radius := 400.0


func physics_process(delta: float) -> void:
	_target_position = get_viewport().get_mouse_position()
	
	var distance_to_target : float = owner.global_position.distance_to(_target_position)
	
	if distance_to_target < TARGET_TRESHOULD:
		return
	
	_velocity = _calculate_velocity(_velocity, owner.global_position, _target_position, owner.max_speed, owner.mass)
	
	_velocity = owner.move_and_slide(_velocity)
	
	owner.rotation = _velocity.angle()


func _calculate_velocity(velocity: Vector2, position: Vector2, target_position: Vector2, speed: float, mass: float) -> Vector2:
	var desiered_velocity := (target_position - position).normalized() * speed
	
	var steering := (desiered_velocity - velocity) / mass
	
	return velocity + steering
