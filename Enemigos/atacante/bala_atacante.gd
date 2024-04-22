extends Area2D

var mov = Vector2.RIGHT
var ver_vec = Vector2.ZERO
var jugador = null
var rapidez = 200


func _physics_process(delta):
	translate(mov.normalized() * rapidez * delta)
	


func _on_bala_atacante_body_entered(body):
	if body.is_in_group("daño_enemigo"):
		body.golpe_enemigo(2)
