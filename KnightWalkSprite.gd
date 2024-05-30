extends AnimatedSprite

onready var _animated_sprite = $KnightWalkSprite

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("Run")
	else:
		_animated_sprite.stop()
