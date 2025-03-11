extends Area2D

@export var speed = 300

signal died

func _physics_process(delta: float) -> void:
	global_position.x += -speed * delta

func die():
	died.emit()
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.take_damage()
	die()
