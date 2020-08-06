extends Node2D

onready var hurtbox = $Hurtbox
onready var skullCount = 0



func _on_Hurtbox_area_entered(area):
	hurtbox.create_hit_effect()
	#get the  skull count from world script
	#update the count
	#update the label in the skull ui
	
	
#	skullCount += 1
#
#	var newLabel = str(skullCount) + "/3"
#	print(newLabel)
#	get_node("world/CanvasLayer/SkullUI").get_child(1).text = newLabel
	queue_free()
