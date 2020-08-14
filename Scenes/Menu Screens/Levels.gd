extends Node2D

var level1_mouse_over = false
var level2_mouse_over = false
var level2Open = false
var level3_mouse_over = false
var level3Open = false

func _ready():
	if 2 in Global.saved_data["level_passed"]:
		level2Open = true
		var lockedSprite = get_node("Level2Area/level2lock")
		lockedSprite.queue_free()
	
	if 3 in Global.saved_data["level_passed"]:
		level3Open = true
		var lockedLevel3 = get_node("Level3Area/level3lock")
		lockedLevel3.queue_free()
		
func _input(event):
	if level1_mouse_over and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Scenes/world.tscn")
	
	if level2_mouse_over and level2Open and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Scenes/Level2/Level2.tscn")
		
	if level3_mouse_over and level3Open and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Scenes/Level3/Level3.tscn")

func _on_Level1Area_mouse_entered():
	var highLight = get_node("Level1Area/highlight")
	highLight.visible = true
	level1_mouse_over = true

func _on_Level1Area_mouse_exited():
	var highLight = get_node("Level1Area/highlight")
	highLight.visible = false
	level1_mouse_over = false

func _on_Level2Area_mouse_entered():
	var highLight = get_node("Level2Area/highlight")
	highLight.visible = true
	level2_mouse_over = true

func _on_Level2Area_mouse_exited():
	var highLight = get_node("Level2Area/highlight")
	highLight.visible = false
	level2_mouse_over = false

func _on_Level3Area_mouse_entered():
	var highLight = get_node("Level3Area/highlight")
	highLight.visible = true
	level3_mouse_over = true

func _on_Level3Area_mouse_exited():
	var highLight = get_node("Level3Area/highlight")
	highLight.visible = false
	level3_mouse_over = false
	
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/MainMenu.tscn")
