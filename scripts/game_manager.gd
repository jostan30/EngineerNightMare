extends Node

var score = 0
@onready var coin_counter: Label = $"../PLayers/Player/Camera2D2/Coin_Counter"

func add_point () :
	score+=1
	coin_counter.text = "Coin :"+str(score)
