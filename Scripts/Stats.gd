extends Node
export var max_health = 4 setget set_max_health
var health = max_health setget set_health

var skull_count = 0

signal no_health
signal health_change(value)
signal max_health_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(value):
	health = value
	emit_signal("health_change", health)
	if health <= 0:
		emit_signal("no_health")
		
func _ready():
	self.health = max_health
		

