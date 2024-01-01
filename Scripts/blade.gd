@tool
extends Node3D
class_name blade

var _g_blade : MeshInstance3D
var _mat : ShaderMaterial = preload("res://Resources/grassBladeMAT.tres")
var _in_mat : ShaderMaterial

func _init():
	_g_blade = get_child(0)

func _ready():
	_in_mat = _mat.duplicate(true) as ShaderMaterial
	_g_blade.material_override = _in_mat

func _set_direction(dir : Vector3):
	_in_mat.set_shader_parameter("_dir", dir)
	#_in_mat.set_shader_parameter("_dir", Vector2(exp(-pow(dir.x, 2.0)), exp(-pow(dir.z, 2.0))))
	#_in_mat.set_shader_parameter("_dir", Vector2(dir.x, dir.z))
