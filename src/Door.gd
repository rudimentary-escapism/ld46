extends Node2D


func _on_Dialogue_hide():
    if $StaticBody2D:
        $Sprite.frame = 1
        $StaticBody2D.queue_free()
