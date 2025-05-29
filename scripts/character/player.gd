extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0
@onready var _animated_sprite = $AnimatedSprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump: AudioStreamPlayer2D = $Jump

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		_animated_sprite.play("jump")
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")

	if direction:
		if direction == 1.0 :
			animated_sprite_2d.flip_h = false
		if direction == -1.0:
			animated_sprite_2d.flip_h =true
		velocity.x = direction * SPEED
		_animated_sprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		_animated_sprite.play("idle")

	move_and_slide()

func enemy():
	pass
