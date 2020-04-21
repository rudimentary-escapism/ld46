extends KinematicBody2D

signal shot_down

export (int) var run_speed := 100
export (int) var gravity := 1000
export (int) var hp := 3

var player: Player = null
var is_dead := false

onready var animations: AnimationNodeStateMachinePlayback =\
    $AnimationTree.get("parameters/playback") 

func _ready() -> void:
    connect("shot_down", self, "_on_shot_down")
    $VisionZone.connect("body_entered", self, "_on_VisionZone_body_entered")
    $AttackZone.connect("body_entered", self, "_on_AttackZone_body_entered")

func _physics_process(delta):
    var velocity = Vector2.ZERO
    if player:
        velocity = position.direction_to(player.position) * run_speed
    velocity.y = gravity * delta
    move_and_slide(velocity)
    $Sprite.flip_h = velocity.x > 0
    

func _on_shot_down() -> void:
    hp -= 1
    if hp == 0:
        die()
    

func _on_VisionZone_body_entered(body: Node) -> void:
    if not is_dead:
        player = body
        animations.travel("walking")
        

func _on_AttackZone_body_entered(body: Node) -> void:
    if not is_dead:
        body.emit_signal("attacked")


func _on_Head_shot_down():
    die()
    
func die() -> void:
    animations.travel("death")
    is_dead = true
    $CollisionShape2D.disabled = true
    $Head/CollisionShape2D.disabled = true
    set_physics_process(false)
