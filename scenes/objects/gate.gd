extends StaticBody2D

signal player_entered_gate(body)

#func _on_area_2d_body_entered(body) -> void:
	#player_entered_gate.emit(body)
	#print("body entered at GATE")

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_entered_gate.emit(body)
	
