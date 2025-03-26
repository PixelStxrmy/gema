extends Node

var main = "res://Scenes/main.tscn"

var game_controller : GameController
var plr : Player
var Player_input: Vector2
var player_busy: bool = false
var fade_transition : FadeController

@export var world_2d : Node2D
@export var gui: Control
