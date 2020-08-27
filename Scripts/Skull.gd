extends Node2D

onready var hurtbox = $Hurtbox

var plagueDoctor = preload("res://Scenes/PlagueDoctor.tscn")

func _on_Hurtbox_area_entered(_area):
	hurtbox.create_hit_effect()
	
	#change the number of skulls the player has 
	#main level
	var levelNode = get_parent()
	var stuff_ysort = levelNode.get_node("YSort")
	
	PlayerStats.skull_count += 1
	levelNode.get_node("CanvasLayer").get_node("SkullUI/Label").set_text(str(PlayerStats.skull_count) +"/3")
	
	queue_free()
	
	var destroyedSkull = get_node(".")
	destroyedSkull.remove_from_group("Skull")
	destroyedSkull.add_to_group("Destroyed_Skull")
	
	if PlayerStats.skull_count == 3:
		levelNode.get_node("ClosedDoor").queue_free()
		var ghosts = get_tree().get_nodes_in_group("Ghost")
		for ghost in ghosts:
			ghost.queue_free()
	else:
		
		var otherSkulls = get_tree().get_nodes_in_group("Skull")
		#get other skull locations
		for skull in otherSkulls:
			var ghost = plagueDoctor.instance()
			#get position
			var skullLocation = skull.global_position
			print(skullLocation)
			#add a plague doctor to location in ysort
			print(skullLocation[0])
			ghost.position.x = skullLocation[0]
			ghost.position.y = skullLocation[1]
			stuff_ysort.add_child(ghost)
			
	
