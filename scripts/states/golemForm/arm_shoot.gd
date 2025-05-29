extends State

@export var projectile_node: PackedScene
var can_transition: bool = false

func enter():
	super.enter()
	animation_player.play("armShoot")
	await animation_player.animation_finished
	
	shoot()
	can_transition = true

func shoot():
	var projectile = projectile_node.instantiate()
	projectile.position = owner.position
	get_tree().current_scene.add_child(projectile)

func transition():
	if can_transition:
		can_transition = false
		get_parent().change_state("Follow")
