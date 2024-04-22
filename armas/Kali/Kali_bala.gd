extends Node2D


var direction = Vector2.RIGHT
var repidez = 400

	
func _process(delta):
	translate(direction.normalized() * repidez * delta)

func _on_Kali_bala_body_entered(body):
	if body.is_in_group("daño_amigo"):
		body.destruir(2)
	queue_free()
