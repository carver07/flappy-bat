extends Node2D

@onready var o: PackedScene = preload("res://Scenes/obstacles.tscn")
var vp_width = 320

func _ready() -> void:
	### This is how the game starts
	Autoload.score = 0
	
func _process(_delta: float) -> void:
	### This keeps the bat floating as well
	$CanvasLayer/Control/Label.text = str(Autoload.score)


func _on_timer_timeout() -> void:
	### This restarts the game after you get hit by a rock
	var oi = o.instantiate()
	var modifiers = [-0.3,-0.2,-0.1,0,0.1,0.2,0.3]
	var st_scale = randf_range(1.2,2.8)
	var sm_scale = 4 - st_scale + modifiers.pick_random()
	oi.position.x = vp_width
	
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	
		
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	if oi.get_child_count() > 1:
		oi.get_child(1).scale = Vector2(sm_scale,sm_scale)
		oi.get_child(1).get_child(0).frame = randi_range(0,3)
	
	add_child(oi)
	$Timer.start()
