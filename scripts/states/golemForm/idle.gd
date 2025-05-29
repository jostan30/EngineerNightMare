extends State

@onready var collision: CollisionShape2D = $"../../playerDetection/CollisionShape2D"

var player_enetered: bool = false:
	set(value):
		player_enetered = value
		collision.set_deferred("disabled", value)

func transition():
	if player_enetered:
		get_parent().change_state("Follow")

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.has_method('enemy'):
		player_enetered = true
