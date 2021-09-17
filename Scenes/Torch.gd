extends Node2D

export var lit = false
export var temporary = true

signal became_lit
signal became_unlit

func light():
	lit = true
	$Area2D/AnimatedSprite.set_animation("lit")
	emit_signal("became_lit")
	if temporary:
		$ExtinguishTimer.start()

func extinguish():
	lit = false
	$Area2D/AnimatedSprite.set_animation("unlit")
	emit_signal("became_unlit")

func _ready():
	if lit:
		light()
	else:
		extinguish()

func _on_Area2D_area_entered(area):
	if area.is_in_group("Fireball") and !lit:
		light()
		area.die()

func _on_ExtinguishTimer_timeout():
	if temporary:
		extinguish()
