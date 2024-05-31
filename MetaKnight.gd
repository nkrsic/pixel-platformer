extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite 

# Need to set up animations using AnimationPlayer first for 
# use with the AnimationTree
onready var _meta_sprite = $Sprite
onready var _animation_tree = $AnimationTree
onready var _state_machine = _animation_tree.get("parameters/playback") 

func _ready():
	_state_machine.travel("idle")

func _process(delta):
	var axis_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var attacking = Input.is_action_pressed("ui_select")
	var crouching = Input.is_action_pressed("ui_down")
	
	
	if axis_x > 0 and attacking:
		_state_machine.travel("combo_right")
	elif axis_x < 0 and attacking:
		_state_machine.travel("combo_left")
	elif crouching and axis_x > 0: 
		_state_machine.travel("crouchwalk_right")
	elif axis_x > 0:
		_state_machine.travel("run")
	elif crouching and axis_x < 0:
		_state_machine.travel("crouchwalk_left")
	elif axis_x < 0:
		_state_machine.travel("run_left")
	elif attacking:
		_state_machine.travel("combo_right")
	else: 
#		_animated_sprite.animation = "idle"
		# STATE MACHINE
		_state_machine.travel("idle")
		


#func _physics_process(delta):
#	var axis_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
#
#	if axis_x > 0: 
##		_animated_sprite.animation = "run"
##		_animated_sprite.flip_h = false
#		# STATE MACHINE
#		_state_machine.travel("run")
#	elif axis_x < 0:
#
#		# STATE MACHINE
#		_state_machine.travel("run_left")
#	else: 
##		_animated_sprite.animation = "idle"
#		# STATE MACHINE
#		_state_machine.travel("idle")
		
