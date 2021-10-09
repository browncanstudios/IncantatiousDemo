extends Node2D

func _on_IncantationBoulder_destroy_boulders():
	if $Boulder1 != null:
		$Boulder1.die()
	if $Boulder2 != null:
		$Boulder2.die()
	if $Boulder3 != null:
		$Boulder3.die()
	if $Boulder4 != null:
		$Boulder4.die()
