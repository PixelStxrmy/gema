extends Node2D

@onready var lamp:PointLight2D = $PointLight2D

@export var energy:float
@export var textureScale:float

func _ready() -> void:
	lamp.energy = energy
	lamp.texture_scale = textureScale
