extends Control


signal restart


func _on_Button_button_up():
	emit_signal("restart")
