extends Node2D

onready var hurtbox = $Hurtbox

func _on_Hurtbox_area_entered(_area):
	hurtbox.create_hit_effect()
	
	#change the number of skulls the player has
	var grandParent = get_parent().get_parent()
	PlayerStats.skull_count += 1
	var UICanvasLayer = grandParent.get_child(3)
	print("skull count ", PlayerStats.skull_count)
	UICanvasLayer.get_child(1).get_child(1).set_text(str(PlayerStats.skull_count) + "/3" )
	
	if PlayerStats.skull_count == 3:
		grandParent.get_child(4).queue_free()
		
	queue_free()
