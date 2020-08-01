extends Node2D

const BarrelEffect = preload("res://Scenes/BarrelEffect.tscn")

func create_barrel_effect():
	var barrelEffect = BarrelEffect.instance()
	get_parent().add_child(barrelEffect)
	barrelEffect.global_position = global_position

func _on_Hurtbox_area_entered(area):
	create_barrel_effect()
	queue_free()
