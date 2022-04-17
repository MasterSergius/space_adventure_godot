extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 500
var rotation_speed = 20
var velocity = Vector2.ZERO
var move_target = null
var target_pos = null
var angle_to_target = null
var acceleration = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_move_target(target):
	target_pos = target
	angle_to_target = target_pos.angle()
	

func move_to_target(delta):
	# rotation = -target_pos.angle() * rotation_speed * delta
	# rotation = target_pos.angle()
	# print(velocity)
	# var angle = target_pos.angle() * 180 / PI
	# var vel_x = speed * cos(angle)
	# var vel_y = speed * sin(angle)
	# velocity = Vector2(vel_x, vel_y)
	# velocity = Vector2(speed, 0).rotated(angle_to_target)
	velocity = Steering.calculate_velocity(
		velocity,
		global_position,
		target_pos,
		speed,
		acceleration
	)
	rotation = velocity.angle()
	return move_and_slide(velocity)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		set_move_target(get_global_mouse_position())
	
	if target_pos:
		move_to_target(delta)
