extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var velocity: Vector2
var start_position: Vector2
const SPEED = 150.0
const MAX_DISTANCE = 1000.0

func _ready():
	start_position = global_position
	var target = get_closest_enemy()

	if target:
		var direction = (target.global_position - global_position).normalized()
		velocity = direction * SPEED
	else:
		velocity = Vector2.RIGHT * SPEED

func _physics_process(delta: float) -> void:
	position += velocity * delta
	rotation = velocity.angle()

	if global_position.distance_to(start_position) > MAX_DISTANCE:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	queue_free()

func get_closest_enemy() -> Node2D:
	var enemies = get_tree().get_nodes_in_group("enemies")
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

func attack_weapon():
	var damage = 30
	pass
