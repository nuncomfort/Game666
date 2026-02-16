extends CharacterBody2D

@export var speed = 40
@export var health = 3
var player = null
@onready var _animated_sprite = $AnimatedSprite2D


func _ready():
	add_to_group("enemies")
	player = get_tree().current_scene.find_child("Player", true, false)

func _physics_process(_delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		
		if abs(velocity.x) > abs(velocity.y): 
			if velocity.x > 0:
				_animated_sprite.play("walk_right")
			else:
				_animated_sprite.play("walk_left")
		else: 
			if velocity.y > 0:
				_animated_sprite.play("walk")
			else:
				_animated_sprite.play("walk_back") 



func take_damage(amount):
	health -= amount
	print("Враг ранен! HP: ", health)
	if health <= 0:
		queue_free()
