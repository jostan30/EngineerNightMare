extends State
@onready var golem: CharacterBody2D = $"../.."

@onready var immunity_time: Timer = $"../../ImmunityTime"

var hurt_period: bool = false

func enter():
	super.enter()
	hurt_period = false
	hurt()	

func hurt():
	print("hurt")
	#Engine.time_scale = 0.5
	animation_player.play("hurt")
	await animation_player.animation_finished
	hurt_period = true
	#Engine.time_scale = 1.0


func transition():
	if hurt_period:
		if abs(owner.direction) < 30:
			get_parent().change_state("Attack")
		if abs(owner.direction) > 350:
			get_parent().change_state("Idle")
		if abs(owner.direction) < 350 && abs(owner.direction) > 30:
			get_parent().change_state("Walk")
		if golem.health <= 0:
			get_parent().change_state("Die")
