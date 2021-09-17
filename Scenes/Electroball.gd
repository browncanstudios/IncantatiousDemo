extends Area2D

export var speed = 220

var direction = Vector2(0, 0)

func _physics_process(delta):
	var velocity = direction.normalized() * speed
	
	rotation = velocity.angle()
	position += velocity * delta

func die():
	get_tree().queue_delete(self)

func _on_LifetimeTimer_timeout():
	die()

func _on_Electroball_body_entered(body):
	if body.is_in_group("IronBlock") or body.is_in_group("IronBlockBig"):
		body.charge += 100_000
		die()
