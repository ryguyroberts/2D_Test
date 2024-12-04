extends LevelParent

var outside_scene = preload("res://scenes/levels/outside.tscn")

func _on_exit_gate_area_body_entered(_body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property($Player,"speed", 0, 0.5)
	call_deferred("change_scene", outside_scene)
	
func change_scene(scene_var: PackedScene) -> void:
	get_tree().change_scene_to_packed(scene_var)
