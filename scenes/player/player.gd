extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true


const speed = 400

func _process(_delta):
	
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	
	#movement
	velocity = direction * speed
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		print('shoot laser')
		$Timer.start()
		can_laser = false
		
	# grenade input
	if Input.is_action_pressed("secondary action") and can_grenade:
		print('shoot grenade')
		can_grenade = false


func _on_timer_timeout() -> void:
	can_laser = true
