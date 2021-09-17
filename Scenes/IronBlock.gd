extends RigidBody2D

export var charge = 0

func _on_IronBlock_body_entered(body):
	if body.is_in_group("IronBlock") or body.is_in_group("IronBlockBig"):
		var mean_charge = (body.charge + charge) / 2
		charge = mean_charge
		body.charge = mean_charge
