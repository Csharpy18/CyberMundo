extends KinematicBody2D 

export var rapidez = 100
export var vida: int = 10
var PJ_S = preload("res://Pj/daño_pj.tscn")

func Sangrado_Pj():
	var efecto_Pj = PJ_S.instance()
	efecto_Pj.position = global_position
	get_tree().current_scene.add_child(efecto_Pj)

var screen_size

func golpe_enemigo(amount: int):
	Sangrado_Pj()
	vida -= amount
	if vida <= 0:
		queue_free()
		get_tree().change_scene("res://fin del JUEGO/fin.tscn")
	
func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	var velocidad = Vector2.ZERO
	if Input.is_action_pressed("derecha"):
		velocidad.x += 1
	if Input.is_action_pressed("izquierda"):
		velocidad.x -= 1
	if Input.is_action_pressed("abajo"):
		velocidad.y += 1
	if Input.is_action_pressed("arriba"):
		velocidad.y -= 1

	if velocidad.length() > 0:
		velocidad = velocidad.normalized() * rapidez
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.animation = "descansar"

	position += velocidad * delta
	
	if velocidad.x != 0:
		$AnimatedSprite.animation = "caminar"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocidad.x < 0
	if velocidad.y != 0:
		$AnimatedSprite.animation = "caminar"
		
# warning-ignore:return_value_discarded
 move_and_slide(velocidad)
