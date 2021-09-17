extends Node2D

func _on_TorchA_became_lit():
	check_torches()

func _on_TorchB_became_lit():
	check_torches()

func check_torches():
	if $TorchA.lit and $TorchB.lit:
		$TorchA.temporary = false
		$TorchB.temporary = false
		$HorizontalGate.open()
