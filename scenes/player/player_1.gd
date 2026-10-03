extends Node2D

@export var speed: float = 200.0

@onready var character_body: CharacterBody2D = $CharacterBody2D

func _physics_process(delta: float) -> void:
	var input_vector := Vector2.ZERO
	
	# Read individual inputs
	var x_input := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y_input := Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Prioritize horizontal movement over vertical to prevent diagonal movement
	if x_input != 0:
		input_vector.x = x_input
	elif y_input != 0:
		input_vector.y = y_input

	# Set velocity and move (move_and_slide handles delta internally in Godot 4)
	character_body.velocity = input_vector * speed
	character_body.move_and_slide()
