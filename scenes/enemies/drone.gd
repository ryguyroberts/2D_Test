extends CharacterBody2D


const SPEED = 100.0

func _process(delta: float) -> void:
	var direction: Vector2 = Vector2.RIGHT
	
	velocity = direction * SPEED
	
	move_and_slide()

func hit():
	print('damage')
