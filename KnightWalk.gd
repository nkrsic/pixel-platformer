extends KinematicBody2D

onready var _animated_sprite = $KnightWalkSprite

var jump_velocity = 150.0
var gravity_scale = 200.0
var walkspeed = 100
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
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("Run")
	else:
		_animated_sprite.stop()
	var motion = velocity*delta
#	move_and_collide(motion)
	move_and_slide(velocity)
	
	
