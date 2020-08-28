extends Node2D


func _ready():
	var message = get_node("CanvasLayer/Label")
	var playerTimeNode = get_node("CanvasLayer/PlayerTime")
	message.text = Global.summaryMessage
	
	var endTimes = Global.endPlayerTime.split(":")

	var timeDone = endTimes[0] + " min " + endTimes[1] + "." + endTimes[2] + " sec"
	playerTimeNode.text = timeDone
	if playerTimeNode.text != "":
		Global.save_game(Global.currentLevelNumber,Global.endPlayerTime)

	

func _on_PlayAgain_pressed():
	PlayerStats.health = PlayerStats.max_health
	PlayerStats.skull_count = 0
	get_tree().change_scene(Global.currentScenePath)


func _on_Levels_pressed():
	#get_tree().change_scene("res://Scenes/Menu Screens/Levels.tscn")
	#get the current level number increase it and go to the next level
	var nextLevelNumber = Global.currentLevelNumber + 1
	
	pass


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/MainMenu.tscn")
