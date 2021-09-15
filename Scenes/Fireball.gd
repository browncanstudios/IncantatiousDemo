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
