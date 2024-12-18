extends Node2D

@export var speed: int = 100


func _physics_process(delta: float) -> void:
	### This is how the bat floats
	position.x -= speed * delta


func _on_stalactite_body_entered(_body: Node2D) -> void:
	### This makes the rocks and such enter the screen
	get_tree().call_deferred("reload_current_scene")


func _on_stalagmite_body_entered(_body: Node2D) -> void:
	### This keeps the rocks moving acros the screen
	get_tree().call_deferred("reload_current_scene")


func _on_score_body_entered(_body: Node2D) -> void:
	### This gives you a point when you go through the rocks
	Autoload.score += 1


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	### This shows you how many points you have
	queue_free()
