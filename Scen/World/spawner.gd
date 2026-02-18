extends Node2D

@export var mob_scene: PackedScene = preload("res://Scen/World/mob.tscn")

func _on_timer_timeout():
	var mob = mob_scene.instantiate()
	
	var spawn_pos = Vector2(
		randf_range(0, 500),
		randf_range(0, 500)
	)
	
	mob.global_position = spawn_pos
	get_parent().add_child(mob)
	print("Враг появился в: ", spawn_pos)
