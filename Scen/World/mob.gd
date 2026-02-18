extends CharacterBody2D

@export var speed = 40
@export var health = 1
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

func take_damage(amount: int):
	health -= amount
	print("У врага осталось HP: ", health)
	
	if health <= 0:
		die()

func die():
	set_physics_process(false)
	if abs(velocity.x) > abs(velocity.y): 
		if velocity.x < 0:
			_animated_sprite.play("dead_left")
		else:
			_animated_sprite.play("dead_right")
	else:
				if velocity.y < 0:
					_animated_sprite.play("dead_back")
				else:
					_animated_sprite.play("dead_up")
	
	
	collision_layer = 0
	
	await get_tree().create_timer(0.6).timeout
	queue_free()




func _on_hitbox_body_entered(body: Node2D):
	while is_instance_valid(body) and $hitbox.overlaps_body(body):
		if body.name == "Player":
			if body.has_method("take_damage"):
				body.take_damage(1)
		if is_inside_tree():	
			await get_tree().create_timer(0.1).timeout
		else:
			break
				
				
			


	
