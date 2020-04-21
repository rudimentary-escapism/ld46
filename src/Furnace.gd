extends Node2D

signal activated(dialogue)
signal end_game

export (Script) var start
export (Script) var wait
export (Script) var end

var status = "start"
var active := true

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("action") and $PressE.visible and active:
        match status:
            "start":
                emit_signal("activated", start)
                status = "wait"
            "wait":
                emit_signal("activated", wait)
            "end":
                if has_node("StaticBody2D"):
                    $StaticBody2D.queue_free()
                emit_signal("activated", end)

func _on_Area2D_body_entered(body: Player) -> void:
    if $Opened.visible:
        status = "end"
    $PressE.visible = true


func _on_Area2D_body_exited(body: Player) -> void:
    $PressE.visible = false


func _on_EndZone_body_entered(body):
    if $Opened.visible:
        emit_signal("end_game")


func _on_Firewoods_body_entered(body):
    $Closed.visible = false
    $Opened.visible = true


func _on_Dialogue_draw():
    active = false


func _on_Dialogue_hide():
    active = true
