extends PlayerState

func enter(prev_state):
	owner.get_node("AnimatedSprite2D").play("jump")
	# Give initial jump velocity only on entering the state
	owner.velocity.y = owner.JUMP_VELOCITY

func update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	owner.velocity.x = direction * owner.SPEED

	# If landed, go back to idle or run depending on input
	if owner.is_on_floor():
		if direction != 0:
			owner.state_machine.change_state("Run")
		else:
			owner.state_machine.change_state("Idle")
