extends CharacterBody2D

@onready var player = get_parent().find_child("Player")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var immunity_time: Timer = $ImmunityTime


var direction : float
var tk_dmg_timer: bool = true

@export var health: = 20:
	set(value):
		health = value
		if value <= 0:
			find_child("FiniteStateMachine").change_state('Die')

func take_dmg():
	if tk_dmg_timer:
		health -= 2
		immunity_time.start()
		tk_dmg_timer = false
		velocity.x = 0
		if find_child("FiniteStateMachine").prv_state == find_child("FiniteStateMachine").find_child("Attack"):
			print("hurt")
			pass
		else:
			find_child("FiniteStateMachine").change_state("Hurt")

func _on_immunity_time_timeout() -> void:
	tk_dmg_timer = true


func _ready() -> void:
	set_physics_process(false)
	
func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	direction = player.position.x - position.x
	
	if direction < 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
	
	move_and_slide()
	

func _physics_process(_delta: float) -> void:
	direction = player.position.x - position.x
	
	if direction < 0:               #if the golem is moving towards the player ie left side
		velocity.x = -1 * 25        #move left side   
	if direction > 0:             #if the golem is moving towards the player ie right side
		velocity.x = 25             #move right side  
	if abs(direction) < 30:         #if player is in attack range
		velocity.x = 0              #stop moving
	if abs(direction) > 250:        #if player not in range
		velocity.x = 0              #stop moving 

	move_and_slide()                #mve and sld is req on all processess thats why it was not working before
