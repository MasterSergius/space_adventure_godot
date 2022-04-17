extends Node

static func calculate_velocity(
	velocity: Vector2,
	object_position: Vector2,
	target_position: Vector2,
	max_speed: float,
	acceleration: float
	) -> Vector2:
	var desired_velocity := (target_position - object_position).normalized() * max_speed
	var steering := (desired_velocity - velocity) / acceleration
	return velocity + steering
