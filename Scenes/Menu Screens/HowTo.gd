extends Node2D

func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/MainMenu.tscn")


func _on_Levels_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/Levels.tscn")
