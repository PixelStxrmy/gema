class_name FadeController  extends CanvasLayer



@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready():
	Global.fade_transition = self
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		color_rect.visible = false

func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")
