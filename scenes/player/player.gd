extends CharacterBody2D

const speed = 500

func _process(_delta):
	
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	
	#movement
	velocity = direction * speed
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_pressed("primary action"):
		print('shoot laser')
		
	# grenade input
	if Input.is_action_pressed("secondary action"):
		print('shoot grenade')
