extends Node

# currently this script does all miscelanious stuff
# It spawns the player in, loads the default scene, and handles all
# the defaults that apply to the game as a whole
# a lot of this stuff will likely be moved into the scene manager, however
# default varibles should stay here to make playtesting levels easy

@export var initialLevel:PackedScene
@export var playerScene:PackedScene

var player:Node3D

@onready var playerRoot := $Player
@onready var LevelRoot := $Level
@onready var ManagersRoot := $Managers

# Load a scene on start
func _ready() -> void:
	var scene = initialLevel.instantiate()
	LevelRoot.add_child(scene)
	spawnPlayer()
	

func spawnPlayer() -> void:
	player = playerScene.instantiate()
	var spawns:Array[Node] = get_tree().get_nodes_in_group("player_spawn")
	
	if spawns.size() > 1:
		push_warning("More than 1 player spawn point detected. Using first found.")
		return
	elif spawns.size() < 1:
		push_warning("No player spawn detected!")
		return
	
	if spawns[0] is not Node3D:
		push_warning("Incorrect group assigned to node!")
		return
	
	player.position = spawns[0].position
	playerRoot.add_child(player)
	return
