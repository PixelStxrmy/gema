extends Control


func _on_button_pressed() -> void:
	Global.game_controller.change_gui_scene("res://Scenes/changetest1.tscn")
