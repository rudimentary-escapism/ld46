extends Node2D

signal activated(dialogue)

export (Script) var start
export (Script) var wait
export (Script) var end

var status = "start"

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("action") and $PressE.visible:
        match status:
            "start":
                emit_signal("activated", start)
                status = "wait"
            "wait":
                emit_signal("activated", wait)
            "end":
                emit_signal("activated", end)

func _on_Area2D_body_entered(body: Player) -> void:
    if body.has_woods:
        status = "end"
    $PressE.visible = true


func _on_Area2D_body_exited(body: Player) -> void:
    $PressE.visible = false
