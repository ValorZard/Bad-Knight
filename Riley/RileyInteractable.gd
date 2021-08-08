extends StaticBody2D

export(String) var dialogicTimeline
var playerInArea := false
var new_dialog


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and playerInArea and new_dialog == null:
		new_dialog = Dialogic.start(dialogicTimeline)
		new_dialog.connect("timeline_end", self, "reset_interaction")
		add_child(new_dialog)

func reset_interaction(timelineName):
	new_dialog = null
	print("Reset")

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		playerInArea = true


func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		playerInArea = false
