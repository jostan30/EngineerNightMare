extends State

var can_transition: bool = false

func enter():
	super.enter()
	animation_player.play('armourUp')
	await animation_player.animation_finished
	can_transition = true

func transition():
	if can_transition:
		can_transition = false
		get_parent().change_state('Follow')
