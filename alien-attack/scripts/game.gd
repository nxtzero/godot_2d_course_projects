extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_hit_sound = $PlayerHitSound


var gos_scene = preload("res://scenes/game_over_screen.tscn")

func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_death_zone_area_entered(area: Area2D) -> void:
	#area.die()
	area.queue_free()


func _on_player_took_damage() -> void:
	player_hit_sound.play()
	lives -= 1
	hud.set_lives(lives)
	if lives == 0:
		print("game over")
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var gos = gos_scene.instantiate()
		gos.set_score(score)
		ui.add_child(gos)
		
	#else:	
	#	print("lives:" + str(lives))


func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	#print("enemy died")
	score += 100
	hud.set_score_label(score)
	print("Score:" + str(score))
	enemy_hit_sound.play()


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance: Variant) -> void:
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", _on_enemy_died)
