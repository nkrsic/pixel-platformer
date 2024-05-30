extends KinematicBody2D

var jump_velocity = 150.0
var gravity_scale = 200.0
var walkspeed = 150
var velocity = Vector2()

func get_input():
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walkspeed
	if Input.is_action_pressed("ui_right"):
		velocity.x = walkspeed
	else:
		velocity.x = 0


func _physics_process(delta):
	velocity.y = gravity_scale
	get_input()
	var motion = velocity*delta
	move_and_collide(motion)


