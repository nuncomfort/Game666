extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@export var speed = 70
@export var Bullet : PackedScene
var bullet = preload("res://Scen/World/bullet.tscn") 

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $RayCast2D/Marker2D.global_transform
	 
func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
func _physics_process(_delta):
	get_input()
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_pressed("ui_left"):
		_animated_sprite.play("idle_right")
	elif Input.is_action_pressed("ui_right"):
		_animated_sprite.play("idle_left")
	elif Input.is_action_pressed("ui_up"):
		_animated_sprite.play("idle_back")
	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.play("idle")
	else:
		_animated_sprite.stop()
	$RayCast2D.look_at(get_global_mouse_position())
