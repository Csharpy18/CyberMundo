extends Area2D

var active = false

func _ready():
	connect("body_entered", self, "_on_NPC_body_enterd") 
	connect("body_exited", self, "_on_NPC_body_exited") 
	

func _process(dalta):
	$Pregunta.visible = active
	
func _input(event):
	if get_node_or_null("DialogNode") == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused =true 
			var dialogo = Dialogic.start("linea-1")
			dialogo.pause_mode = Node.PAUSE_MODE_PROCESS
			dialogo.connect("timeline_end", self, "unpause")
			add_child(dialogo)
			
func unpause(timeline_name):
	get_tree().paused = false


func _on_NPC_body_enterd(body):
	if body.name == "Pj Kevin":
		active = true

func _on_NPC_body_exited(body):
	if body.name == "Pj Kevin":
		active = false
