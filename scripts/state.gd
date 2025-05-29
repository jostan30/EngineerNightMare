extends Node2D
class_name State

@onready var debug = owner.find_child("debug")
@onready var animation_player = owner.find_child("AnimationPlayer")

var target: Node2D = null

func _ready():
	set_physics_process(false)

func enter():
	set_physics_process(true)

func exit():
	set_physics_process(false)

func transition():
	pass

func _physics_process(delta: float):
	_find_closest_enemy()
	transition()
	debug.text = name

func _find_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("Enemies")
	var closest_dist = INF
	var closest = null

	for enemy in enemies:
		if not enemy.is_inside_tree() or not enemy.has_method("enemy"):
			continue
			
		var dist = owner.global_position.distance_to(enemy.global_position)
		
		if dist < closest_dist:
			closest_dist = dist
			closest = enemy

	target = closest
