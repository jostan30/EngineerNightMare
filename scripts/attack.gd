extends State

@onready var cooldown: Timer = $"../../Cooldown"


func enter():
	super.enter()
	attack()


func attack():
	cooldown.start()
	animation_player.play("attack")
	await animation_player.animation_finished


func _on_cooldown_timeout() -> void:
	attack()
	if abs(owner.direction) > 20:
		cooldown.stop()

func transition():
	if abs(owner.direction) > 20:
		if cooldown.is_stopped():
			get_parent().change_state("Walk")
