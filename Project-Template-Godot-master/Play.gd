tool
extends Button


export(String, FILE) var next_scene_path = ""

func _on_Play_button_up():
	get_tree().change_scene(next_scene_path)



func _get_configuration_warning():
	if next_scene_path == "":
		return "next_scene_path cannot be blank"
	else:
		return ""
