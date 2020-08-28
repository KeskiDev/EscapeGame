extends Node2D


func _on_Play_Level_again_pressed():
	PlayerStats.health = PlayerStats.max_health
	PlayerStats.skull_count = 0
	get_tree().change_scene(Global.currentScenePath)


func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/MainMenu.tscn")
