extends Node2D

const BarrelEffect = preload("res://Scenes/BarrelEffect.tscn")
onready var hurtbox = $Hurtbox

func create_barrel_effect():
	var barrelEffect = BarrelEffect.instance()
	get_parent().add_child(barrelEffect)
	barrelEffect.global_position = global_position

func _on_Hurtbox_area_entered(area):
	hurtbox.create_hit_effect()
	create_barrel_effect()
	queue_free()
