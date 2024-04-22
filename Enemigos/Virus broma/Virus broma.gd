extends KinematicBody2D

var jugador = null
var movimiento = Vector2.ZERO
export var rapidez = 200
var vida: int = 10
var Rojo_S = preload("res://Enemigos/Efectos enemigos/daño_rojo.tscn")
var Amarillo_S = preload("res://Enemigos/Efectos enemigos/daño_Amarillo.tscn")
var Verde_S = preload("res://Enemigos/Efectos enemigos/daño_verde.tscn")

func Sangrado_Virus():
	var efecto_R = Rojo_S.instance()
	var efecto_A = Amarillo_S.instance()
	var efecto_V = Verde_S.instance()
	efecto_R.position = global_position
	efecto_A.position = global_position
	efecto_V.position = global_position
	if vida <= 10 and vida >= 6:
		get_tree().current_scene.add_child(efecto_V)
	if vida <= 5 and vida >= 4:
		get_tree().current_scene.add_child(efecto_A)
	if vida <= 3:
		get_tree().current_scene.add_child(efecto_R)

# warning-ignore:unused_argument
func _physics_process(delta):

	movimiento = Vector2.ZERO
	
	if jugador != null:
		movimiento = position.direction_to(jugador.position) * rapidez
	else:
		movimiento = Vector2.ZERO
	movimiento = movimiento.normalized()
	movimiento = move_and_collide(movimiento)
	
func _on_Area2D_body_entered(body):
	if body != self:
		jugador = body

# warning-ignore:unused_argument
func _on_Area2D_body_exited(body):
	jugador = null

func destruir(amount: int):
	vida -= amount
	Sangrado_Virus()
	if vida <= 0:
		queue_free()

func _on_golpear_body_entered(body):
	if body.is_in_group("daño_enemigo"):
		body.golpe_enemigo(1)
