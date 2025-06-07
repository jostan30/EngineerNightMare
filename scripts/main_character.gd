extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine:Node = $StateMachine

func _ready ():
	print("Player ready .Starting state" ,state_machine.current_state)
	
func _physics_process(delta:float) :
	state_machine._update_state(delta)
	
	if not is_on_floor():
		velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity") * delta

	move_and_slide()
