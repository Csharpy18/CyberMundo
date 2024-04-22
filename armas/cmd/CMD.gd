extends Node2D

var rm_scene = preload("res://armas/cmd/RM.tscn")


func flip():
	$Cmd_sprite.set_flip_v(get_global_mouse_position().x < global_position.x)

func disparar():
	var RM = rm_scene.instance()
	RM.direction = $Position2D.global_position - global_position
	RM.global_position = $Position2D.global_position
	get_tree().get_root().add_child(RM)
	
func _physics_process(delta):
	look_at(get_global_mouse_position())
	flip()
	
	if Input.is_action_just_pressed("click"):
		disparar()
