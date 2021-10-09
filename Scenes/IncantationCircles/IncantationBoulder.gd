extends Node2D

signal destroy_boulders

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
	if message.count("explosion") > 0:
		emit_signal("destroy_boulders")

		# call this if we want to make the incantation circle no longer usable
		make_inactivatable()

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
