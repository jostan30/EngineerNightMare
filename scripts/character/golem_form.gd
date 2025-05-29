extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

var target: Node2D = null
var direction := Vector2.ZERO
var defence := 0

var health = 1000:
	set(value):
		health = value
		if value <= 0:
			find_child("FiniteStateMachine").change_state('Death')
		elif value <= 500 and defence == 0:
			defence = 0.5
			find_child("FiniteStateMachine").change_state('ArmourBuff')

func get_closest_enemy() -> Node2D:
	var enemies = get_tree().get_nodes_in_group("Enemies")
	var closest = null
	var closest_dist = INF

	for enemy in enemies:
		if not enemy.is_inside_tree() or not enemy.has_method("enemy"):
			continue
		var dist = global_position.distance_to(enemy.global_position)
		if dist < closest_dist:
			closest = enemy
			closest_dist = dist

	return closest

func _ready():
	set_physics_process(false)

func _process(delta: float) -> void:
	target = get_closest_enemy()

	if target:
		direction = target.global_position - global_position
		if direction.x < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false

func _physics_process(delta: float) -> void:
	if target:
		direction = target.global_position - global_position
		velocity = direction.normalized() * 40
		move_and_collide(velocity * delta)

func take_damage():
	health -= 10 * defence
