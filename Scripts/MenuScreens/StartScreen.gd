extends Node2D

func _ready():
	#load game and save the global variables
	Global.saved_data = Global.load_game()

func _on_play_pressed():
	#eventually randomize this between the three levels
	get_tree().change_scene("res://Scenes/world.tscn")

func _on_howTo_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/HowTo.tscn")

func _on_levels_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/Levels.tscn")
