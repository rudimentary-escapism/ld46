extends Node2D


func _on_Player_attacked():
	$CanvasLayer/DeatchScreen.visible = true


func _on_DeatchScreen_restart():
	get_tree().reload_current_scene()
