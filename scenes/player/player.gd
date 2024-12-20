extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser(pos, direction)
signal grenade(pos, direction)


@export var max_speed: int = 500
var speed: int = max_speed


func _process(_delta):
	
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	
	#rotate
	look_at(get_global_mouse_position())
	
	# Gun nozzle positions
	var laser_markers: Array = $LaserStartPositions.get_children()
	var seleced_laser: Marker2D = laser_markers[randi() % laser_markers.size()]
	
	# Player Direction
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	#movement
	velocity = direction * speed
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$GPUParticles2D.emitting = true
		can_laser = false
		$TimerLaser.start()
		laser.emit(seleced_laser.global_position, player_direction)
		
	# grenade input
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		can_grenade = false
		$TimerGrenade.start()
		grenade.emit(seleced_laser.global_position, player_direction)


# Action Cooldowns
func _on_timer_laser_timeout() -> void:
	can_laser = true
	
func _on_timer_grenade_timeout() -> void:
	can_grenade = true
