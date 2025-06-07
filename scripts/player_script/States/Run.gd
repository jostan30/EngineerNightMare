extends PlayerState
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func enter(prev_state) :
	owner.get_node("AnimatedSprite2D").play("run")
	
func update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	if direction == 1.0 :
		animated_sprite_2d.flip_h =false
	if direction == -1.0:
		animated_sprite_2d.flip_h =true
		

	if direction == 0:
		owner.state_machine.change_state("Idle")
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
	# Move player horizontally
	owner.velocity.x = direction * owner.SPEED
