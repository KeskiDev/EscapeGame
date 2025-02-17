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
		
	if Global.nextLevelScenePath == "":
		get_node("Levels").visible = false
		
	var fastestTimeLabel = get_node("CanvasLayer/BestTime")
	if Global.newFastestTime:
		fastestTimeLabel.visible = true
	else:
		fastestTimeLabel.visible = false

func _on_PlayAgain_pressed():
	PlayerStats.health = PlayerStats.max_health
	PlayerStats.skull_count = 0
	get_tree().change_scene(Global.currentScenePath)

#go to the next level
func _on_Levels_pressed():
	get_tree().change_scene(Global.nextLevelScenePath)


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/MainMenu.tscn")
