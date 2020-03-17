extends Control

onready var pause = get_tree()
onready var pauseM = get_node("ColorRect")
onready var score = get_node("Label")
onready var pauseT = get_node("ColorRect/Label2")

var paused = false setget set_paused

func set_paused(value):
	paused = value
	pause.paused = value
	pauseM.visible = value

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.paused = not paused
		pause.set_input_as_handled()

func _ready():
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()

func update_interface():
	score.text = "Score: %s" % PlayerData.score

func _on_PlayerData_player_died():
	set_paused(true)
	pauseT.text = "You Died"
	
