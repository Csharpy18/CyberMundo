extends Node2D

var direction = Vector2.RIGHT
var repidez = 400

	
func _process(delta):
	translate(direction.normalized() * repidez * delta)

func _on_RM_body_entered(body):
	if body.is_in_group("daño_amigo"):
		body.destruir(1)
	queue_free()
