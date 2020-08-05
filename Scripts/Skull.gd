extends Node2D

onready var hurtbox = $Hurtbox



func _on_Hurtbox_area_entered(area):
	hurtbox.create_hit_effect()
	#add skull count
	queue_free()
