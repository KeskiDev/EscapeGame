extends Node2D

func _ready():
	Global.currentScenePath = "res://Scenes/Level5/Level5.tscn"
	Global.currentLevelNumber = 5
	Global.nextLevelScenePath = ""
	Global.newFastestTime = false
	PlayerStats.health = 4
	PlayerStats.skull_count = 0

func _on_doorClosedNotify_body_entered(body):
	if body.is_in_group("player"):
		var levelNode = get_node("CanvasLayer/PlayerMessage/Label")
		levelNode.text = "The way is shut by the dead. Find the skulls!"


func _on_doorClosedNotify_body_exited(body):
	if body.is_in_group("player"):
		var levelNode = get_node("CanvasLayer/PlayerMessage/Label")
		levelNode.text = ""


func _on_levelCleared_body_entered(body):
	if body.is_in_group("player"):
		var playerTime = get_node("CanvasLayer/Countdown/Label").text
		Global.endPlayerTime = playerTime
		Global.summaryMessage = "You made it out in: "
		
		get_tree().change_scene("res://Scenes/Menu Screens/Summary.tscn")
