#@tool
extends MeshInstance3D


var _time : float = 0.0
@export var _radius : float = 1.0
func _process(delta):
	_time += delta
	position = Vector3(sin(_time) * _radius, 0.8, cos(_time) * _radius)
