extends Node2D

var opening = false

func open():
	opening = true

func _process(delta):
	if opening:
		if $LeftGate.position.x >= -64:
			$LeftGate.position.x -= delta * 20
		else:
			$LeftGate.position.x = -64
		if $RightGate.position.x <= 64:
			$RightGate.position.x += delta * 20
		else:
			$RightGate.position.x = 64

		if $LeftGate.position.x == -64 and $RightGate.position.x == 64:
			opening = false
