extends Node2D

func _physics_process(_delta):
	# TODO: think about what this looks like with more iron blocks!
	var charge_diff = abs($IronBlock.charge - $IronBlockBig.charge)
	var distance = $IronBlock.position.distance_to($IronBlockBig.position)
	var force_magnitude = charge_diff / (distance * distance)
	var force = force_magnitude * ($IronBlockBig.position - $IronBlock.position).normalized()
	$IronBlock.apply_central_impulse(force)
