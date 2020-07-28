extends Node

export var max_health = 1
export var max_attack_points = 1
onready var health = max_health setget set_health
onready var attack_points = max_attack_points

signal no_health

func set_health(health_value):
	health = health_value
	if health <= 0:
		emit_signal("no_health")

