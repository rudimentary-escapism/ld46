extends Node2D


func _on_Dialogue_hide():
    if $StaticBody2D:
        $StaticBody2D.queue_free()
