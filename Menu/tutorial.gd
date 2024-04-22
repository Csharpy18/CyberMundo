extends Button


func _on_tutorial_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Tutorial/toturial.tscn")
