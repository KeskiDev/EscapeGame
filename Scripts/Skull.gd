extends Node2D

onready var hurtbox = $Hurtbox
onready var skullCount = 0



func _on_Hurtbox_area_entered(area):
	hurtbox.create_hit_effect()
	
	#change the number of skulls the player has
	var grandParent = get_parent().get_parent()
	grandParent.SkullCount += 1
	var UICanvasLayer = grandParent.get_child(3)
	print("skull count ", grandParent.SkullCount)
	UICanvasLayer.get_child(1).get_child(1).set_text(str(grandParent.SkullCount) + "/3" )
	
	if grandParent.SkullCount == 3:
		grandParent.get_child(4).queue_free()
		
		
	
	queue_free()
