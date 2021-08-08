extends KinematicBody2D

var velocity = Vector2.ZERO
var facingLeft
func _ready():
	facingLeft = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if input_vector.x > 0 and facingLeft == true:
		$Sprite.set_flip_h(true)
		facingLeft = false
		$RayCast2D.rotation_degrees = -90
	elif input_vector.x < 0 and facingLeft == false:
		$Sprite.set_flip_h(false)
		facingLeft = true
		$RayCast2D.rotation_degrees = 90
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
			elif $RayCast2D.get_collider().get_parent().get_meta("type") == "talkableObject":
				print("dialogic")
