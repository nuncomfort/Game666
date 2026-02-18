extends CanvasLayer

var max_value: int

func set_value(new_value):
	$"Control/hp bar/TextureProgressBar".value=100.0/max_value*new_value
