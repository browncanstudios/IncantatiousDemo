extends Node2D

export var activatable = true
var active = false
var player_ref

func _ready():
	if active:
		$IncantationCircle/AnimatedSprite.set_animation("active")
	else:
		$IncantationCircle/AnimatedSprite.set_animation("inactive")

	# uncomment this to test this scene by itself
	# $SpeechProcessor.turn_on()

func _on_SpeechProcessor_processed_message_received(message):
	if player_ref != null:
		player_ref.get_node("WordBubble").append(message)
	if message.count("electricity") > 0:
		spawn_fireball()

# TODO: consider who owns this fireball
func spawn_fireball():
	var spawn_global_position = global_position
	var spawn_direction = Vector2(0.0, 1.0)
	if player_ref != null:
		spawn_global_position = player_ref.global_position
		spawn_direction = player_ref.direction

	var electroball = load("res://Scenes/Electroball.tscn").instance()
	add_child(electroball)
	electroball.direction = spawn_direction
	electroball.rotation = electroball.direction.angle()
	electroball.global_position = spawn_global_position
	
	# call this if we want to make the incantation circle no longer usable
	# make_inactivatable()

func _on_IncantationCircle_body_entered(body):
	if !activatable:
		return
	if body.name == "Player":
		activate(body)

func _on_IncantationCircle_body_exited(body):
	if !activatable:
		return
	if body.name == "Player":
		deactivate()

func activate(player):
	active = true
	$IncantationCircle/AnimatedSprite.set_animation("active")
	$SpeechProcessor.turn_on()
	player_ref = player
	player_ref.get_node("WordBubble").activate()

func deactivate():
	active = false
	$IncantationCircle/AnimatedSprite.set_animation("inactive")
	$SpeechProcessor.turn_off()
	if player_ref != null:
		player_ref.get_node("WordBubble").deactivate()
		player_ref = null

func make_inactivatable():
	activatable = false
	deactivate()
