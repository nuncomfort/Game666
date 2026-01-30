extends Area2D
var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(Player):
	if Player.is_in_group("Skeleton"):
		Player.queue_free()
	queue_free()
