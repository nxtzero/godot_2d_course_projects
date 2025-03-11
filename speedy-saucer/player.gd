extends RigidBody2D

var force = 1500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# test(100)
	print("force:" + str(force))
	print(test(5,6))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# print(Engine.get_frames_per_second())
	# apply_force(Vector2(25, 0))
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(force, 0))
	if Input.is_action_pressed("move_left"):
		apply_force(Vector2(-force, 0))
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2(0, -force))
	if Input.is_action_pressed("move_down"):
		apply_force(Vector2(0, force))
	
func test(a, b):
	var t = a + b
	return t
