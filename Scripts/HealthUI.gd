extends Control

var hearts = 6 setget set_hearts
var max_hearts = 6 setget set_max_hearts
var skulls = 3 setget set_skulls
var max_skulls = 3 setget set_max_skulls

onready var heartUIFull = $HEartUIFull
onready var heartUIEmpty = $HeartUIEmpty
onready var skullUIFull = $skullUIFull
onready var skullUIEmpty = $skullsUIEmpty



func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 15
	
	
func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * 15

func set_skulls(value):
	skulls = clamp(value, 0, max_skulls)
	if(skullUIFull != null):
		skullUIFull.rect_size = skulls * 15

func set_max_skulls(value):
	max_skulls = max(value, 1)
	self.skulls = min(skulls, max_skulls)
	if skullUIEmpty != null:
		skullUIEmpty.rect_size.x = max_skulls * 15

func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_change", self, "set_hearts")
	PlayerStats.connect("max_health_changed", self, "set_max_hearts")
