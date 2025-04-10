class_name room_manager  extends Node

@onready var area_name : String = get_parent().name
@onready var area_num = area_name.to_int()

var room_path0 = "res://Scenes/Rooms/Area_0/room_0_" 
var room_path1 = ".tscn"
var first_room = 1

func _ready() -> void:
	add_room(first_room)
	del_room(get_current_room())


func get_new_room(num:String):
	var room = load(room_path0 + num + room_path1).instantiate()
	if (room):
		print(room)
		return room

func get_current_room():
	var room = self.get_child(0)
	return room

func add_room(room):
	var loaded_room = get_new_room(str(room))
	print(loaded_room)
	self.add_child(loaded_room)

func del_room(room):
	self.remove_child(room)
	print("deleted!")
