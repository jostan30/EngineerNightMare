extends Node2D

var cur_state: State
var prv_state: State

func _ready() -> void:
	cur_state = find_child("Idle") as State
	prv_state = cur_state
	cur_state.enter()

func change_state(state):
	cur_state = find_child(state) as State
	cur_state.enter()
	prv_state.exit()
	prv_state = cur_state
