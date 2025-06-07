extends PlayerState

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var finished := false

func enter(prev_state):
	finished = false
	animated_sprite_2d.play("hurt")

	# Connect only if not already connected
	if not animated_sprite_2d.is_connected("animation_finished", Callable(self, "_on_animated_sprite_2d_animation_finished")):
		animated_sprite_2d.connect("animation_finished", Callable(self, "_on_animated_sprite_2d_animation_finished"))


func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "Hurt":
		finished = true

func update(delta):
	if not finished:
		return  # Wait until animation is done

	var direction = Input.get_axis("move_left", "move_right")

	if Input.is_action_just_pressed("jump") and owner.is_on_floor():
		owner.state_machine.change_state("Jump")
	elif direction != 0.0 :
		owner.state_machine.change_state("Run")
	elif Input.is_action_just_pressed("Attack1"):
		owner.state_machine.change_state("Attack1")
	elif Input.is_action_just_pressed("Attack2"):
		owner.state_machine.change_state("Attack2")
	elif Input.is_action_just_pressed("Attack3"):
		owner.state_machine.change_state("Attack3")
	elif Input.is_action_just_pressed("Defend") :
		owner.state_machine.change_state("Defend")
	else : 
		owner.state_machine.change_state("Idle")
