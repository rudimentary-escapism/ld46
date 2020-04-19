extends KinematicBody2D

signal shot_down

export (int) var run_speed := 100

var player: Player = null

func _ready() -> void:
    connect("shot_down", self, "_on_shot_down")
    $VisionZone.connect("body_entered", self, "_on_VisionZone_body_entered")
    $AttackZone.connect("body_entered", self, "_on_AttackZone_body_entered")

func _physics_process(delta):
    var velocity = Vector2.ZERO
    if player:
        velocity = position.direction_to(player.position) * run_speed
        velocity.y = 0
    velocity = move_and_slide(velocity)
    

func _on_shot_down() -> void:
    queue_free()
    

func _on_VisionZone_body_entered(body: Node) -> void:
    if body is Player:
        player = body
        

func _on_AttackZone_body_entered(body: Node) -> void:
    if body is Player:
        body.emit_signal("attacked")
