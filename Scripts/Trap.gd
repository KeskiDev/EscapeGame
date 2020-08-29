extends Area2D

#preload barrel, vase, table2, crate
var barrel = preload("res://Scenes/Barrel.tscn")
var vase = preload("res://Scenes/JarEffect.tscn")
var table = preload("res://Scenes/decorations/table2.tscn")
var crate = preload("res://Scenes/decorations/crate.tscn")

var rng = RandomNumberGenerator.new()


func _on_Trap_body_exited(body):
	var trap = get_node(".")
	var main_scene_sort = trap.get_parent().get_node("YSort")
	
	rng.randomize()
	var random_number = rng.randi_range(1,4)
	
	#spawn a random decoration to block where the trap is
	if body.is_in_group("player"):
		match random_number:
			1:
				var barrier = barrel.instance()
				#get position
				var new_position = trap.global_position
				barrier.global_position = new_position
				main_scene_sort.call_deferred("add_child", barrier)
			2:
				var barrier = barrel.instance()
				#get position
				var new_position = trap.global_position
				barrier.global_position = new_position
				main_scene_sort.call_deferred("add_child", barrier)
			3:
				var barrier = table.instance()
				#get position
				var new_position = trap.global_position
				barrier.global_position = new_position
				main_scene_sort.call_deferred("add_child", barrier)
			4:
				var barrier = crate.instance()
				#get position
				var new_position = trap.global_position
				barrier.global_position = new_position
				main_scene_sort.call_deferred("add_child", barrier)
		
		trap.queue_free()
	
