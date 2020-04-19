extends RayCast2D

onready var line: Line2D = $Line2D
onready var timer: Timer = $Timer
onready var animations: AnimationNodeStateMachinePlayback =\
    $AnimationTree.get("parameters/playback") 


func _on_Player_shot():
    animations.travel("shoot")
    var direction := get_local_mouse_position().normalized()
    cast_to = direction * 600
    force_raycast_update()
    if is_colliding():
        line.set_point_position(1, to_local(get_collision_point()))
        get_collider().emit_signal("shot_down")
    else:
        line.set_point_position(1, cast_to)
    line.visible = true
    timer.start()


func _on_Timer_timeout():
    line.visible = false
