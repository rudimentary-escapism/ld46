extends Control

export (Script) var dialogue = null setget set_dialogue
export (Texture) var furniture
export (Texture) var player
export (Texture) var furniture_end
export (Texture) var player_end

var list := []

func _ready():
    if list.size() > 0 and visible:
        line(list.pop_front())

func set_dialogue(d) -> void:
    list = d.new().dialogue
    
func line(d: Dictionary) -> void:
    $ImageLeft.visible = false
    $ImageRight.visible = false
    var image: Control = get_node(d.position)
    image.visible = true
    $Label.text = d.text
    match d.name:
        "player":
            image.texture = player
        "furniture":
            image.texture = furniture
        "playe_end":
            image.texture = player_end
        "furniture_end":
            image.texture = furniture_end

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("action") or event.is_action_pressed("fire"):
        if list.size() > 0 and visible:
            line(list.pop_front())
        else:
            visible = false


func _on_Dialogue_started():
    line(list.pop_front())


func _on_Furnace_activated(d):
    set_dialogue(d)
    visible = true
