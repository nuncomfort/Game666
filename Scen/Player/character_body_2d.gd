extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		_animated_sprite.play("idle_right")
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("idle_left")
	if Input.is_action_pressed("ui_up"):
		_animated_sprite.play("idle_back")
	if Input.is_action_pressed("ui_down"):
		_animated_sprite.play("idle")
	else:
		_animated_sprite.stop()
