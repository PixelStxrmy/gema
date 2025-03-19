class_name Player extends CharacterBody2D

@onready var int_ray: RayCast2D = $InteractionRay

const speed = 450
const ACCEL = 20.0

var global_delta
var input:Vector2
var PlayerInput = get_input()

func _ready() -> void:
	Global.plr = self
	Signals.set_player_position.connect(set_pos)
	DialogueManager.dialogue_ended.connect(unfreeze)
	int_ray.target_position = (Vector2.DOWN * 30)

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	print("STEEEEPd")
	return input.normalized()

func _process(delta: float) -> void:
	if !Global.Player_busy:
		if PlayerInput != Vector2.ZERO:
			if PlayerInput == Vector2.UP:
				int_ray.target_position = PlayerInput * 10 
			else:
				int_ray.target_position = PlayerInput * 10
		global_delta = delta
		
		
	move_and_slide()

#sd

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("right") or event.is_action_pressed("left"):
		
		PlayerInput = get_input()
		velocity = lerp(velocity, PlayerInput * speed, global_delta * ACCEL)
		move_and_slide()
	
	if event.is_action_pressed("down"):
		velocity = lerp(velocity, Vector2.DOWN * speed, global_delta * ACCEL)
	if event.is_action_pressed("up"):
		velocity = lerp(velocity, Vector2.UP * speed, global_delta * ACCEL)
	


func set_pos(pos):
	position = pos
	
func freeze():
	Global.plr.set_physics_process(false)
	Global.plr.set_process(false)
	Global.plr.set_process_input(false)

func unfreeze():
	Global.plr.set_physics_process(true)
	Global.plr.set_process(true)
	Global.plr.set_process_input(true)
