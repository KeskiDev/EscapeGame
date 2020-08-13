extends Node2D


func _ready():
	var message = get_node("CanvasLayer/Label")
	var playerTimeNode = get_node("CanvasLayer/PlayerTime")
	message.text = Global.summaryMessage
	playerTimeNode.text = Global.endPlayerTime
	if playerTimeNode.text != "":
		Global.save_game(Global.currentLevelNumber, playerTimeNode.text)


func saveTimeCheck(minutes, seconds, ms):
	#check 1-3 fastest times
	#if minutes is slower than #1 minutes check #2 jne
	#if seconds is slower than # check next #
	#if still slower do nothing
	#if faster save the new time
	
	pass
	

func _on_PlayAgain_pressed():
	PlayerStats.health = PlayerStats.max_health
	PlayerStats.skull_count = 0
	get_tree().change_scene(Global.currentScenePath)


func _on_Levels_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/Levels.tscn")


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/MainMenu.tscn")
