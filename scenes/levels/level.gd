extends Node2D

var laser_scene = preload("res://scenes/projectiles/laser.tscn")

func _on_gate_player_entered_gate(body) -> void:
	print("player has entered gate")
	print(body)


func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	laser.position = pos
	add_child(laser)

func _on_player_grenade() -> void:
	print("grenade from level")
