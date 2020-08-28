extends Node2D


func _ready():
	Global.currentScenePath = "res://Scenes/world.tscn"
	Global.currentLevelNumber = 1

func _on_levelCleared_body_entered(body):
	if body.is_in_group("player"):
		var gameTimer = get_child(3).get_child(2)
		
		var playerTime = gameTimer.get_child(0).text
		Global.endPlayerTime = playerTime
		Global.summaryMessage = "You made it out in:"
		
		get_tree().change_scene("res://Scenes/Menu Screens/Summary.tscn")

func _on_doorClosedNotify_body_entered(body):
	if body.is_in_group("player"):
		var levelNode = get_node("CanvasLayer/PlayerMessage/Label")
		levelNode.text = "The way is shut by the dead. Find the skulls!"


func _on_doorClosedNotify_body_exited(body):
	if body.is_in_group("player"):
		var levelNode = get_node("CanvasLayer/PlayerMessage/Label")
		levelNode.text = ""
