extends KinematicBody2D

signal shot

export (int) var speed := 1200
export (int) var jump_speed := -1800
export (int) var gravity := 4000
export (float, 0, 1.0) var friction := 0.1
export (float, 0, 1.0) var acceleration := 0.25

var velocity := Vector2.ZERO

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("fire"):
        emit_signal("shot")

func _physics_process(delta: float) -> void:
    get_input()
    velocity.y += gravity * delta
    velocity = move_and_slide(velocity, Vector2.UP)

func get_input() -> void:
    var dir := 0
    if Input.is_action_pressed("ui_right"):
        dir += 1
    if Input.is_action_pressed("ui_left"):
        dir -= 1
    if dir != 0:
        velocity.x = lerp(velocity.x, dir * speed, acceleration)
    else:
        velocity.x = lerp(velocity.x, 0, friction)
