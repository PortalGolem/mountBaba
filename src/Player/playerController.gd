extends AnimatableBody3D

@export var sensitivity:float = .01

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(event.relative.x * sensitivity)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
