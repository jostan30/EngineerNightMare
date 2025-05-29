extends State

func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("stab")


func transition():
	var distance = owner.global_position.distance_to(owner.target.global_position)
	
	if distance > 30:
		get_parent().change_state("Follow")
