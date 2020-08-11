extends Node2D


func _ready():
	var message = get_node("CanvasLayer/Label")
	var playerTimeNode = get_node("CanvasLayer/PlayerTime")
	message.text = Global.summaryMessage
	playerTimeNode.text = Global.endPlayerTime
	if playerTimeNode.text != "":
		splitTime(playerTimeNode.text)
	


func splitTime(playerTime):
	var timeSplit = playerTime.split(':',true)
	var minutes = timeSplit[0]
	var seconds = timeSplit[1] 
	var milliSeconds = timeSplit[2]
	
	saveTimeCheck(minutes,seconds,milliSeconds)
	

func saveTimeCheck(minutes, seconds, ms):
	#check 1-3 fastest times
	#if minutes is slower than #1 minutes check #2 jne
	#if seconds is slower than # check next #
	#if still slower do nothing
	#if faster save the new time
	
	pass
	

func _on_PlayAgain_pressed():
	PlayerStats.health = PlayerStats.max_health
	
	#change this to be the current level they just played
	get_tree().change_scene(Global.currentScenePath)


func _on_Levels_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/Levels.tscn")


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/Levels.tscn")
