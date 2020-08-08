extends Control

export var minute = 0
var second = 0
var ms = 0
onready var timer = $Timer
onready var label = $Label


func _process(delta):
	if ms > 9:
		second += 1
		ms = 0
	if second > 59:
		minute += 1
		second = 0
	
	label.text = str(minute) + ":" + str(second) + ":" + str(ms)
	


func _on_Timer_timeout():
	ms += 1
