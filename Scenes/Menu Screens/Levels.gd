extends Node2D

var level1_mouse_over = false
var level2_mouse_over = false
var level3_mouse_over = false
var level4_mouse_over = false
var level5_mouse_over = false
var level2Open = false
var level3Open = false
var level4Open = false
var level5Open = false

func _ready():
	Global.saved_data = Global.load_game()
	if Global.saved_data.size() <= 0:
		Global.save_data["level_passed"] = Global.level_passed
		
	if 1 in Global.saved_data.get("level_passed"):
		var level1time = Global.saved_data["level_one_time"]
		if(level1time != ""):
			var level1timesSplit = level1time.split(":")
			get_node("Level1Area/Label").text = "Best time: " + level1timesSplit[0] + " min " + level1timesSplit[1] + "." + level1timesSplit[2] + " secs"
	if 2 in Global.saved_data["level_passed"]:
		level2Open = true
		var lockedSprite = get_node("Level2Area/level2lock")
		var level2time = Global.saved_data["level_two_time"]
		if level2time != "":
			var level2timesSplit = level2time.split(":")
			get_node("Level2Area/Label").text = "Best time: " + level2timesSplit[0] + " min " + level2timesSplit[1] + "." + level2timesSplit[2] + " secs"
		else:
			get_node("Level2Area/Label").text = "--"
		lockedSprite.queue_free()
	if 3 in Global.saved_data["level_passed"]:
		level3Open = true
		var lockedLevel3 = get_node("Level3Area/level3lock")
		var level3time = Global.saved_data["level_three_time"]
		if level3time != "":
			var level3timesSplit = level3time.split(":")
			get_node("Level3Area/Label").text = "Best time: " + level3timesSplit[0] + " min " + level3timesSplit[1] + "." + level3timesSplit[2] + " secs"
		else:
			get_node("Level3Area/Label").text = "--"
		lockedLevel3.queue_free()
	if 4 in Global.saved_data["level_passed"]:
		level4Open = true
		var lockedLevel4 = get_node("Level4Area/level4lock")
		var level4time = Global.saved_data["level_four_time"]
		if(level4time != ""):
			var level4timesSplit = level4time.split(":")
			get_node("Level4Area/Label").text = "Best time: " + level4timesSplit[0] + " min " + level4timesSplit[1] + "." + level4timesSplit[2] + " secs"
		else:
			get_node("Level4Area/Label").text = ""
		lockedLevel4.queue_free()
	if 5 in Global.saved_data["level_passed"]:
		level5Open = true
		var lockedLevel5 = get_node("Level5Area/level5lock")
		var level5time = Global.saved_data["level_five_time"]
		if(level5time != ""):
			var level5timesSplit = level5time.split(":")
			get_node("Level5Area/Label").text = "Best time: " + level5timesSplit[0] + " min " + level5timesSplit[1] + "." + level5timesSplit[2] + " secs"
		else:
			get_node("Level5Area/Label").text = ""
		lockedLevel5.queue_free()
		
func _input(event):
	if level1_mouse_over and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Scenes/world.tscn")
	
	if level2_mouse_over and level2Open and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Scenes/Level2/Level2.tscn")
		
	if level3_mouse_over and level3Open and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Scenes/Level3/Level3.tscn")
	
	if level4_mouse_over and level4Open and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Scenes/Level4/Level4.tscn")
	
	if level5_mouse_over and level5Open and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Scenes/Level5/Level5.tscn")

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
	
func _on_Level4Area_mouse_exited():
	var highLight = get_node("Level4Area/highlight")
	highLight.visible = false
	level4_mouse_over = false


func _on_Level4Area_mouse_entered():
	var highLight = get_node("Level4Area/highlight")
	highLight.visible = true
	level4_mouse_over = true

func _on_Level5Area_mouse_entered():
	var highLight = get_node("Level5Area/highlight")
	highLight.visible = true
	level5_mouse_over = true


func _on_Level5Area_mouse_exited():
	var highLight = get_node("Level5Area/highlight")
	highLight.visible = false
	level5_mouse_over = false
	
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu Screens/MainMenu.tscn")



