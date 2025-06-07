extends Node

var states :Dictionary ={}
var current_state:PlayerState =null
var current_state_name :String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Register all child states
	for child in get_children() :
		if child is PlayerState:
			states[child.name] = child
			child.owner = owner #Set Player as the owner of the state
	change_state("Idle") #Start with Idle

func change_state(new_state_name: String):
	if current_state:
		current_state.exit()
	
	current_state = states.get(new_state_name)
	current_state_name = new_state_name

	if current_state:
		current_state.enter(null)

func _update_state(delta: float):
	if current_state:
		current_state.update(delta)
