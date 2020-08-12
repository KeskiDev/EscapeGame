extends Node2D

var level1_mouse_over = false
var level2_mouse_over = false
var level3_mouse_over = false

func _input(event):
	if level1_mouse_over and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Scenes/world.tscn")

func _on_Level1Area_mouse_entered():
	level1_mouse_over = true

func _on_Level1Area_mouse_exited():
	level1_mouse_over = false


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/MainMenu.tscn")
