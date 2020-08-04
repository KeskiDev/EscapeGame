extends StaticBody2D

const BarrelEffect = preload("res://Scenes/JarEffect.tscn")
onready var hurtbox = $Hurtbox
onready var stats = $Stats

func create_barrel_effect():
	var barrelEffect = BarrelEffect.instance()
	get_parent().add_child(barrelEffect)
	barrelEffect.global_position = global_position

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	hurtbox.create_hit_effect()


func _on_Stats_no_health():
	create_barrel_effect()
	queue_free()
