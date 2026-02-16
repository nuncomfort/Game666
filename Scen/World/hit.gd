extends Area2D

func _on_hit_box_body_entered(body):
	if body.name == "Player":
		if body.has_method("take_damage"):
			body.take_damage(1)
