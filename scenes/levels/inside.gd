extends LevelParent


func _on_exit_gate_area_body_entered(_body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property($Player,"speed", 0, 0.5)
	call_deferred("change_scene", "res://scenes/levels/outside.tscn")
	
func change_scene(scene_var: String) -> void:
	TransitionLayer.change_scene(scene_var)
