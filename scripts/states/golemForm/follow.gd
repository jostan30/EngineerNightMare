extends State

func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("idle")

func exit():
	super.exit()
	owner.set_physics_process(false)

func transition():
	var distance = owner.global_position.distance_to(owner.target.global_position)
	
	if distance < 30:
		get_parent().change_state("Stab")
		
	elif distance > 130:
		var chance = randi() % 2
		match chance:
			0:
				get_parent().change_state('ArmShoot')
			1:
				get_parent().change_state('LaserBeam')
