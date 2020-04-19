extends Node2D

func _input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        var angle := get_local_mouse_position().angle()
        rotate(angle)
