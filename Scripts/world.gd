extends Node2D

var SkullCount = 0

func _on_levelCleared_body_entered(body):
	print("body entered")
	if body.is_in_group("player"):
		#get the time it took the timer
		var gameTimer = get_child(3).get_child(2)
		#print(gameTimer.name)
		var playerTime = gameTimer.get_child(0).text
		Global.endPlayerTime = playerTime
		Global.summaryMessage = "You made it out in:"
		get_tree().change_scene("res://Scenes/Menu Screens/Summary.tscn")
		
		
