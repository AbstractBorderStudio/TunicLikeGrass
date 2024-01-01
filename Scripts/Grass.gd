@tool
extends Node3D

class_name grass

var _g_blade : PackedScene = preload("res://Scenes/blade.tscn")
var _g_blade_list : Array
var _collider : Node3D
@export var _range = 1.0;

func _ready():
	if Engine.is_editor_hint():
		_collider = get_node("Collider")
		for x in range(11):
			for z in range(11):
				var _in_g_blade = _g_blade.instantiate() as Node3D
				_in_g_blade.position = Vector3((x - 5.0) / 1.5 + (randf()-0.5) * 0.5, 0.0, (z - 5.0) / 1.5 + (randf()-0.5) * 0.5)
				#_in_g_blade.position = Vector3((x - 5.0) / 1.5, 0.0, (z - 5.0) / 1.5)
				add_child(_in_g_blade)
				_g_blade_list.append(_in_g_blade)

func _process(delta):
	if Engine.is_editor_hint():
		for b in _g_blade_list:
			var bl = b as blade
			var dir = (bl.position - _collider.position)
			bl._set_direction(dir.normalized() * (exp(-pow(1.0 - dir.length(), 2.0) * _range)))
