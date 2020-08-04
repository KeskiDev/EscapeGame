extends Node
export var max_health = 4 setget set_max_health
var health = max_health setget set_health

#just for the player
export var max_skulls = 0 setget set_max_skulls
var skulls_acquired = 0 setget set_skulls_acquired

signal no_health
signal health_change(value)
signal max_health_changed(value)

signal skulls_acquired_change(value)
signal max_skulls_changed(value)
#signal level_cleared()

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(value):
	health = value
	emit_signal("health_change", health)
	if health <= 0:
		emit_signal("no_health")
		
func set_max_skulls(value):
	max_skulls = value
	self.skulls_acquired = min(skulls_acquired, max_skulls)
	emit_signal("max_skulls_changed", max_skulls)

func set_skulls_acquired(value):
	skulls_acquired = value
	emit_signal("skulls_acquired_change", skulls_acquired)
	if(skulls_acquired == 3):
		#emit_signal("level_cleared")
		pass
		
		
func _ready():
	self.health = max_health
		

