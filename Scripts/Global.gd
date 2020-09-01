extends Node

var summaryMessage = ""
var endPlayerTime = ""
var endPlayerMinute = 0
var endPlayerSeconds = 0
var endPlayerMilliSeconds = 0


onready var saved_data = {}

var currentScenePath = ""
var nextLevelScenePath = ""
var currentLevelNumber = 0
var levels_cleared = [1]
var newFastestTime = false;

#save time if it's good enough
onready var null_save_dict = {
	"level_one_time": "",
	"level_two_time": "",
	"level_three_time": "",
	"level_passed": [1]
}

func _ready():
	saved_data = load_game()
	if saved_data.empty():
		print("none")
	else:
		print("else")

func split_time(current_time, saved_time, _level):
	#players new time
	var timeSplit = current_time.split(':',true)
	var minutes = timeSplit[0]
	var seconds = timeSplit[1] 
	var milliSeconds = timeSplit[2]
	
	var newTimeIsLess = false
	
	if saved_time == "":
		return true
		
	var saved_time_split = saved_time.split(':',true)
	var save_minutes = saved_time_split[0]
	var saved_seconds = saved_time_split[1]
	var saved_milliseconds = saved_time_split[2]

	if minutes < save_minutes:
		newTimeIsLess = true
	else:
		if seconds < saved_seconds:
			newTimeIsLess = true
		elif seconds == saved_seconds:
			if milliSeconds < saved_milliseconds:
				newTimeIsLess = true

	return newTimeIsLess

#check if level has already been cleared
func check_level(level, saved_levels):
	var nextLevel = level + 1
	#check if this level is already in the level passed list
	if saved_levels.has(nextLevel):
		#won't do anything with this level
		return true
	else:
		#add the new level to the list
		return false
	
func save_game(level, time):
	var saved_data = load_game()
	var node_data
	
	if saved_data.empty():
		node_data = null_save_dict
	else:
		node_data = saved_data
	
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	
	match level:
		1:
			#if true save the new time
			newFastestTime = split_time(time, node_data["level_one_time"], level)
			if newFastestTime:
				node_data["level_one_time"] = time
			#if false save level
			var save_level  = check_level(level, node_data["level_passed"])
			if not save_level:
				node_data["level_passed"].append(2)
		2:
			#if true save the new time
			newFastestTime = split_time(time, node_data["level_two_time"], level)
			if newFastestTime:
				node_data["level_two_time"] = time
			#if false save level
			var save_level  = check_level(level, node_data["level_passed"])
			if not save_level:
				node_data["level_passed"].append(3)
		3:
			#if true save the new time
			newFastestTime = split_time(time, node_data["level_three_time"], level)
			if newFastestTime:
				node_data["level_three_time"] = time
			#if false save level
#			var save_level  = check_level(level, node_data["level_passed"])
#			if save_level:
#				node_data["level_passed"].append(level)
			
	save_game.store_line(to_json(node_data))
	save_game.close()
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return #Error! don't have a save file
	
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		var node_data = parse_json(save_game.get_line())
		
		#save_dict.set(i, node_data[i])
		levels_cleared = node_data["level_passed"]
		saved_data = node_data
	
	return saved_data
	
	
	
	
	
