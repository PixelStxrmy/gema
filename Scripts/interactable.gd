extends Node2D

@export_enum("Dialogue", "Pushable", "test") var interact_type: String

@export var dialogue: String
@export var img: String

@onready var Sprite: Sprite2D = $Sprite2D
@onready var colldetector: RayCast2D = $colldetect

var moving: bool = false

func _ready() -> void:
	Signals.interact.connect(recieve)
	var new_texture = load(img)
	Sprite.texture = new_texture

func _process(delta: float) -> void:
	colldetector.target_position = Global.Player_input *3

func recieve(target):
	if !moving:
		if target:
			print(target)
			if target[0] == self:
				if interact_type == "Dialogue":
					var dia = load(dialogue)
					DialogueManager.show_dialogue_balloon(dia)
					
				if interact_type == "Pushable":
					var tween = get_tree().create_tween()
					var new_pos = position + Global.Player_input *32
					print(colldetector.target_position)
					print(new_pos)
					if !colldetector.get_collider():
						tween.tween_property(self, "position", new_pos, 0.2)
						moving = true
						tween.play()

func tween_over():
	if moving:
		moving = false
	
