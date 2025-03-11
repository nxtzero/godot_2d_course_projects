extends CharacterBody2D

signal took_damage

var speed = 300
var rocket_scene = preload("res://scenes/rocket.tscn")
#var rocket_container
#@onready var rocket_container = get_node("RocketContainer")
@onready var rocket_container = $RocketContainer
@onready var rocket_shot_sound = $RocketShotSound

func _ready() -> void:
	#rscene = preload("res://scenes/rocket.tscn")
	#rocket_container = get_node("RocketContainer")
	pass

func _physics_process(delta: float) -> void:
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
		
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("shoot")):
		shoot()

func shoot():
	#var rocket_scene = load("res://scenes/rocket.tscn")
	#var rocket_scene = preload("res://scenes/rocket.tscn")
	var rocket_instance = rocket_scene.instantiate()
	
	#add_child(rocket_instance)
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80
	
	rocket_shot_sound.play()

func take_damage():
	print("player took damage!")
	#emit_signal("took_damage")
	took_damage.emit()

func die():
	queue_free()
