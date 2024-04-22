extends KinematicBody2D

var jugador = null
var movimiento = Vector2.ZERO
export var rapidez = 200
var vida: int = 15


var escena_bala = preload("res://Enemigos/atacante/bala_atacante.png")
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
	if vida <= 15 and vida >= 10:
		get_tree().current_scene.add_child(efecto_V)
	if vida <= 9 and vida >= 4:
		get_tree().current_scene.add_child(efecto_A)
	if vida <= 3:
		get_tree().current_scene.add_child(efecto_R)

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

func _on_Area2D_body_exited(body):
	jugador = null

func disparar():
	var bala = escena_bala.instance()
	bala.position = get_global_position()
	bala.jugador = jugador
	get_parent().add_child(bala)
	$Timer.set_wait_time(0.7)

func _on_Timer_timeout():
	if jugador != null:
		disparar()

func destruir(amount: int):
	vida -= amount
	Sangrado_Virus()
	if vida <= 0:
		queue_free()
