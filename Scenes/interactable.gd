extends Node2D

@export_enum("Dialogue", "test") var interact_type: String

@export var dialogue: String
@export var img: String

@onready var Sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	Signals.interact.connect(recieve)
	var new_texture = preload("res://Graphics/basic bitch player.png")
	Sprite.texture = new_texture


func recieve(target):
	if target:
		if target in self.get_children():
			print("YOOYPI")
			if interact_type == "Dialogue":
				var dia = load(dialogue)
				Global.Player_busy
				DialogueManager.show_dialogue_balloon(dia)
