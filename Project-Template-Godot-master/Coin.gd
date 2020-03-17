extends Area2D

export var score = 1

onready var player = get_node("AnimationPlayer")

func _on_body_entered(body):
	player.play("fade_out")
	PlayerData.score += score
