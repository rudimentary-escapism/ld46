extends Control

export (Script) var dialogue = null setget set_dialogue
export (Texture) var furniture
export (Texture) var player

var list := []

func _ready():
    if list.size() > 0 and visible:
        line(list.pop_front())

func set_dialogue(d) -> void:
    list = d.new().dialogue
    
func line(d: Dictionary) -> void:
    for c in get_children():
        c.visible = false
    var panel: Control = get_node(d.position)
    panel.visible = true
    panel.get_node("Grid/Label").text = d.text
    panel.get_node("Grid/TextureRect").texture = player\
        if d.name == "player" else furniture

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
