class_name Player
extends KinematicBody2D

signal shot
signal attacked

export (int) var speed := 1200
export (int) var jump_speed := -1800
export (int) var gravity := 1000
export (float, 0, 1.0) var friction := 0.1
export (float, 0, 1.0) var acceleration := 0.25

var velocity := Vector2.ZERO
var has_woods := false

onready var animations: AnimationNodeStateMachinePlayback =\
    $AnimationTree.get("parameters/playback") 

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("fire"):
        emit_signal("shot")
    if event is InputEventMouseMotion:
        scale.x = 1 if get_local_mouse_position().normalized().x > 0 else -1

func _physics_process(delta: float) -> void:
    get_input()
    velocity.y += gravity * delta
    velocity = move_and_slide(velocity, Vector2.UP)

func get_input() -> void:
    var dir := 0
    if Input.is_action_pressed("walk_right"):
        dir += 1
    if Input.is_action_pressed("walk_left"):
        dir -= 1
    if dir != 0:
        velocity.x = lerp(velocity.x, dir * speed, acceleration)
    else:
        velocity.x = lerp(velocity.x, 0, friction)
        
    if Input.is_action_just_pressed("climb_up") and is_on_floor():
        velocity.y = -500
    if Input.is_action_just_pressed("climb_down") and is_on_floor():
        position.y += 10

    if velocity.length() > speed * friction:
        if sign(scale.y) == sign(velocity.x):
            animations.travel("walking")
        else:
            animations.travel("walking_back")
    else:
        animations.travel("idle")


func _on_Dialogue_hide():
    set_physics_process(true)
    set_process_input(true)
    $RayCast2D/Hands.set_process_input(true)


func _on_Dialogue_draw():
    set_physics_process(false)
    set_process_input(false)
    $RayCast2D/Hands.set_process_input(false)


func _on_Firewoods_body_entered(body):
    has_woods = true
