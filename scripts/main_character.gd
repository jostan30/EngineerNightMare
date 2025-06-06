extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var is_attacking =false 

func _ready() ->void :
	is_attacking =false 

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if not is_attacking  :
			animated_sprite_2d.play("jump")
			velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if not is_attacking :
		if Input.is_action_just_pressed("Attack1") :
			is_attacking =true
			animated_sprite_2d.play("Attack1")
		if Input.is_action_just_pressed("Attack2") :
			is_attacking =true
			animated_sprite_2d.play("Attack2")
		if Input.is_action_just_pressed("Attack3") :
			is_attacking =true
			animated_sprite_2d.play("Attack3")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if is_on_floor():
		
		if direction:
			if direction == 1.0 :
				animated_sprite_2d.flip_h =false
			if direction == -1.0 :
				animated_sprite_2d.flip_h =true
			velocity.x = direction * SPEED
			if not is_attacking:
				animated_sprite_2d.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if not is_attacking:
				animated_sprite_2d.play("idle")

	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation.begins_with("Attack1"):
		is_attacking =false 
	if animated_sprite_2d.animation.begins_with("Attack2"):
		is_attacking =false 
	if animated_sprite_2d.animation.begins_with("Attack3"):
		is_attacking =false 
	
