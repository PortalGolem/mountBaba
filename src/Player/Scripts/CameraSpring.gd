extends Camera3D

@export var maxLagBehind:float = 1.0
@export var cameraMoveSpeed:float = 1.0
@export var cameraLookSpeed:float = 1.0

@export var targetPosition:Node3D
@export var lookTarget:Node3D
@export var lookOffset:Vector3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# thank you to godot forums user TRAILtheGREAT
	var targetLookVector = global_position.direction_to(lookTarget.global_position + lookOffset)
	var targetBasis = Basis.looking_at(targetLookVector)
	basis = basis.slerp(targetBasis, cameraLookSpeed * delta)
	
	
	global_position = global_position.move_toward(targetPosition.global_position, cameraMoveSpeed * delta)
	
	if (global_position.distance_squared_to(targetPosition.global_position) > maxLagBehind**2):
		global_position = (global_position - targetPosition.global_position).normalized() * maxLagBehind + targetPosition.global_position
