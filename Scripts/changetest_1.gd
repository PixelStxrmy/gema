extends Control



func _on_button_pressed() -> void:
	Global.fade_transition.transition()
	Global.game_controller.change_gui_scene("res://Scenes/changetest2.tscn")
