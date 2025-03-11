extends Area2D

@export var speed = 120

@onready var visible_notifier = $VisibleNotifier

func _ready() -> void:
	visible_notifier.connect("screen_exited", _on_screen_exited)
	
func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
	#print (speed * delta)
	
func _on_screen_exited():
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	#print(area.name)
	queue_free()
	area.die() 
