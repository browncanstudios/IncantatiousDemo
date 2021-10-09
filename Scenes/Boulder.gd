extends StaticBody2D

func die():
	get_tree().queue_delete(self)
