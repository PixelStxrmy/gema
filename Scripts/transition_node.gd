extends Node

@export var next_scene: String
@export var next_pos: Vector2




func _on_area_2d_area_entered(area: Area2D) -> void:
	
	pass # Replace with function body.

func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.game_controller.change_2d_scene(next_scene, true)
	Signals.set_player_position.emit(next_pos)
	print(next_pos)
	pass # Replace with function body.
