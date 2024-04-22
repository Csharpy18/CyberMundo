extends Node2D

var kali_bala = preload("res://armas/Kali/Kali_bala.tscn")


func flip():
	$kali_Sprite.set_flip_v(get_global_mouse_position().x < global_position.x)

func disparar():
	var bala = kali_bala.instance()
	bala.direction = $Position2D.global_position - global_position
	bala.global_position = $Position2D.global_position
	get_tree().get_root().add_child(bala)
	
func _physics_process(delta):
	look_at(get_global_mouse_position())
	flip()
	
	if Input.is_action_just_pressed("click"):
		disparar()
