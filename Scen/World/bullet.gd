extends Area2D
var speed = 700
var damage: int = 1

func _physics_process(delta):
	position += transform.x * speed * delta
func _on_body_entered(body: Node2D):
	if body.has_method("take_damage"):
		body.take_damage(1)
	queue_free()
