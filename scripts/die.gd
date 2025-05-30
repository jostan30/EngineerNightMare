extends State

func enter():
	super.enter()
	print("dead")
	animation_player.play("die")
