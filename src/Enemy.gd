extends StaticBody2D

signal shot_down

func _ready() -> void:
    connect("shot_down", self, "_on_shot_down")
    

func _on_shot_down() -> void:
    queue_free()
