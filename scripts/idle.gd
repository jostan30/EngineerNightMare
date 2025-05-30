extends State

@onready var collision: CollisionShape2D = $"../../PlayerDetection/CollisionShape2D"
@export var player_entered: bool = false

func enter():
	super.enter()
	animation_player.play("idle")

func _on_player_detection_body_entered(_body: Node2D) -> void:
	player_entered = true

func _on_player_detection_body_exited(_body: Node2D) -> void:
	player_entered = false
	#get_parent().change_state("Idle")


func transition():
	if player_entered:
		get_parent().change_state("Walk")
