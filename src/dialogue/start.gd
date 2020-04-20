extends Node

const LEFT = "ImageLeft"
const RIGHT = "ImageRight"

const PLAYER = "player"
const OVEN = "oven"

var dialogue = [
    {"name": OVEN, "position": LEFT, "text": "You're finally awake. Well, not even last night's snowfall could wake you."},
    {"name": PLAYER, "position": RIGHT, "text": "I accidentally —"},
    {"name": OVEN, "position": LEFT, "text": "It's okay, you deserved to rest. I hope you were warm, I didn't close my eyes all night."},
    {"name": PLAYER, "position": RIGHT, "text": "Yes, thanks."},
    {"name": OVEN, "position": LEFT, "text": "I really don't know how much longer I'm gonna be. I feel some weakness, it's really weird. Every new breath is harder than the last one, and words... They're harder to pronounce."},
    {"name": PLAYER, "position": RIGHT, "text": "Shh, it's gonna be okay, you hear me? Calm down, I'll try to find something nearby that'll give you strength. And it'll be just like before, just you and me."},
    {"name": OVEN, "position": LEFT, "text": "I'm scared... I don't want to die —"},
    {"name": PLAYER, "position": RIGHT, "text": "Just wait, okay? Don't leave me."},
    {"name": OVEN, "position": LEFT, "text": "Thank you."},
    {"name": PLAYER, "position": RIGHT, "text": "I might be able to find something in the room across the street."},
]
