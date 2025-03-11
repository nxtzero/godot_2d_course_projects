extends Node2D

signal touched_player
@export var play_backwards = false
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	if play_backwards:
		animation_player.play("move_backwards")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		touched_player.emit()

func test():
	print("you called me!")
