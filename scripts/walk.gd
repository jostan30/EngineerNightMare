extends State

@onready var collision: CollisionShape2D = $"../../PlayerDetection/CollisionShape2D"

func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("walk")

func exit():
	super.exit()
	owner.set_physics_process(false)
	

func transition():
	if abs(owner.direction) < 30:
		get_parent().change_state("Attack")
	if abs(owner.direction) > 250:
		get_parent().change_state("Idle")
