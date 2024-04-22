extends Control

func _ready():
	pass

func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Nivel 1/Nivel 1.tscn")
