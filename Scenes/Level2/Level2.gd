extends Node2D

func _ready():
	Global.currentScenePath = "res://Scenes/Level2/Level2.tscn"
	Global.currentLevelNumber = 2



func _on_closedExit_body_entered(body):
	pass #player hits this make a message appear


func _on_levelCleared_body_entered(body):
	if body.is_in_group("player"):
		
		var playerTime = get_node("CanvasLayer/Countdown/Label").text
		Global.endPlayerTime = playerTime
		Global.summaryMessage = "You made it out in:"
		
		get_tree().change_scene("res://Scenes/Menu Screens/Summary.tscn")
