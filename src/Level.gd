extends Node2D


func _on_Player_attacked():
	$CanvasLayer/DeatchScreen.visible = true


func _on_DeatchScreen_restart():
	get_tree().reload_current_scene()


func _on_Furnace_end_game():
	get_tree().change_scene("res://src/LastScene.tscn")
