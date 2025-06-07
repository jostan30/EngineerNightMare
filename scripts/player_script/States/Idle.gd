extends PlayerState

func enter(prev_state):
	owner.velocity.x =0
	owner.get_node("AnimatedSprite2D").play("idle")


func update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		owner.state_machine.change_state("Run")
	elif Input.is_action_just_pressed("jump") and owner.is_on_floor():
		owner.state_machine.change_state("Jump")
	elif Input.is_action_just_pressed("Attack1"):
		owner.state_machine.change_state("Attack1")
	elif Input.is_action_just_pressed("Attack2"):
		owner.state_machine.change_state("Attack2")
	elif Input.is_action_just_pressed("Attack3"):
		owner.state_machine.change_state("Attack3")
	elif Input.is_action_just_pressed("Defend") :
		owner.state_machine.change_state("Defend")
