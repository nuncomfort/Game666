extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@export var speed = 70
@export var Bullet : PackedScene
var bullet = preload("res://Scen/World/bullet.tscn") 
@export var health = 10
@export var ui: CanvasLayer
@onready var shoot_sound = $ShootSound
func _ready():
	ui.max_value=health
func shoot():
	var b = bullet.instantiate()
	owner.add_child(b)
	b.global_transform = $m4a1/Marker2D.global_transform
	shoot_sound.play()
	 
func get_input():
	var input_direction = Input.get_vector("A", "D", "W", "S")
	velocity = input_direction * speed
	
func _physics_process(_delta):
	get_input()
	move_and_slide()
	
	if Input.is_action_pressed("shoot"):
		shoot()
	if Input.is_action_pressed("A"):
		_animated_sprite.play("idle_right")
	elif Input.is_action_pressed("D"):
		_animated_sprite.play("idle_left")
	elif Input.is_action_pressed("W"):
		_animated_sprite.play("idle_back")
	elif Input.is_action_pressed("S"):
		_animated_sprite.play("idle")
	else:
		_animated_sprite.stop()
	$m4a1.look_at(get_global_mouse_position())
	
func take_damage(amount: int):
		health -= amount
		print("У игрока осталось HP: ", health)
		ui.set_value(health)
		
		if health <= 0:
			die()
func die():
	print("Игрок погиб!")
	get_tree().reload_current_scene()
