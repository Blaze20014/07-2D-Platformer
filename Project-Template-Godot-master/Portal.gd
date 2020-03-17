tool
extends Area2D

export var next_scene : PackedScene

onready var player = get_node("AnimationPlayer")


func _get_configuration_warning():
	if !next_scene: 
		return "The next scene property cant be empty"
	else:
		""

func teleport():
	player.play("Fade_in")
	yield(player, "animation_finished")
	get_tree().change_scene_to(next_scene)

func _on_body_entered(body):
	teleport()
