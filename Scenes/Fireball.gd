extends Area2D

export var speed = 150

var direction = Vector2(0, 0)

func _physics_process(delta):
	var velocity = direction.normalized() * speed
	
	rotation = velocity.angle()
	position += velocity * delta
	
	if global_position.x < 0 - 16 or global_position.x > 640 + 16:
		die()
	elif global_position.y < 0 - 16 or global_position.y > 480 + 16:
		die()

func _on_Timer_timeout():
	die()

func die():
	get_tree().queue_delete(self)
