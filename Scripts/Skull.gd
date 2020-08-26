extends Node2D

onready var hurtbox = $Hurtbox

func _on_Hurtbox_area_entered(_area):
	hurtbox.create_hit_effect()
	
	#change the number of skulls the player has
	var levelNode = get_parent()
	
	PlayerStats.skull_count += 1
	levelNode.get_node("CanvasLayer").get_node("SkullUI/Label").set_text(str(PlayerStats.skull_count) +"/3")
	
	if PlayerStats.skull_count == 3:
		levelNode.get_node("ClosedDoor").queue_free()
		var ghosts = get_tree().get_nodes_in_group("Ghost")
		for ghost in ghosts:
			ghost.queue_free()
			
	queue_free()
