extends Node2D

var SkullCount = 0





func _on_levelCleared_body_entered(body):
	print("body entered")
	if body.is_in_group("player"):
		#var gameTimer = get_parent().get_child(3).name
		#.get_child(2).get_child(1)
		#print(gameTimer.name)
		#stop the timer
		#compare scores
		#end the game
		get_tree().change_scene("res://Scenes/Menu Screens/Summary.tscn")
		
		
