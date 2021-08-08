extends KinematicBody2D


export(float) var speed
var velocity := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocity != Vector2.ZERO:
		$Sprite.play("Walking")
	else:
		$Sprite.play("default")
	if velocity.x < 0:
		$Sprite.flip_h = true
	if velocity.x > 0:
		$Sprite.flip_h = false

func _physics_process(delta):
	var inputX = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var inputY = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	velocity = Vector2(inputX, inputY).normalized() * speed
	move_and_slide(velocity)
