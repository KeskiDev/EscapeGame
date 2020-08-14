extends Node2D


func _ready():
	var message = get_node("CanvasLayer/Label")
	var playerTimeNode = get_node("CanvasLayer/PlayerTime")
	message.text = Global.summaryMessage
	playerTimeNode.text = Global.endPlayerTime
	if playerTimeNode.text != "":
		Global.save_game(Global.currentLevelNumber, playerTimeNode.text)

	

func _on_PlayAgain_pressed():
	PlayerStats.health = PlayerStats.max_health
	PlayerStats.skull_count = 0
	get_tree().change_scene(Global.currentScenePath)


func _on_Levels_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/Levels.tscn")


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/MainMenu.tscn")
