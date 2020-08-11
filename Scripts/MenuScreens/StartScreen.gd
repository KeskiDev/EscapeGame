extends Node2D

func _on_play_pressed():
	#eventually randomize this between the three levels
	get_tree().change_scene("res://Scenes/world.tscn")

func _on_howTo_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/About.tscn")

func _on_levels_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/Levels.tscn")
