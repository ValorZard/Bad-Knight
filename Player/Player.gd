extends KinematicBody2D

var velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if input_vector != Vector2.ZERO:
		velocity = input_vector.normalized()
	else:
		velocity = Vector2.ZERO
	move_and_collide(velocity * 1.5)
	if Input.is_action_just_pressed("ui_accept"):
		if $RayCast2D.is_colliding() == true:
			print($RayCast2D.get_collider())
			if $RayCast2D.get_collider().get_parent().get_meta("type") == "breakableObject":
				$RayCast2D.get_collider().get_parent().queue_free()
