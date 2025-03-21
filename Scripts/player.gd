class_name Player extends CharacterBody2D

@onready var int_zone: Area2D = $intZone

const SPEED = 300
const ACCEL = 20.0

var global_delta
var input:Vector2
var PlayerInput = get_input()

func _ready() -> void:
	Global.plr = self
	Signals.set_player_position.connect(set_pos)

	int_zone.position = (Vector2.DOWN * 20)

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()

func _process(delta: float) -> void:
	
	PlayerInput = get_input()
	
	if (int_zone && PlayerInput != Vector2.ZERO):
		int_zone.position = PlayerInput * 20
	
	velocity = lerp(velocity, PlayerInput * SPEED, delta * ACCEL)
		
		
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		
		var target = int_zone.get_overlapping_areas()
		if target:
			Signals.interact.emit(target)
		else:
			target = int_zone.get_overlapping_bodies()
			if target:
				Signals.interact.emit(target)
			else:
				print("I fucking give up man")


func set_pos(pos):
	position = pos
	
