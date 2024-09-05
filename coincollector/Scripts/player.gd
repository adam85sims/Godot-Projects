extends Area2D

var direction: Vector2
var min_positions: Vector2 = Vector2(20, 176)
var max_positions: Vector2 = Vector2(520, 765)
@export var speed: int = 350
var can_move: bool

func _process(delta):
	if can_move:
		position += direction * speed * delta
		position.x = clamp(position.x, min_positions.x, max_positions.x)
		position.y = clamp(position.y, min_positions.y, max_positions.y)
	else: $AnimatedSprite2D.animation = "Idle"
		


func _on_up_button_button_down():
	can_move = true
	direction = Vector2.UP
	$AnimatedSprite2D.animation = "Back"
	

func _on_up_button_button_up():
	can_move = false

func _on_down_button_button_down():
	can_move = true
	direction = Vector2.DOWN
	$AnimatedSprite2D.animation = "Front"
	

func _on_down_button_button_up():
	can_move = false
	
func _on_left_button_button_down():
	can_move = true
	direction = Vector2.LEFT
	$AnimatedSprite2D.animation = "Walk"
	$AnimatedSprite2D.flip_h = true
	
func _on_left_button_button_up():
	can_move = false
	
func _on_right_button_button_down():
	can_move = true
	direction = Vector2.RIGHT
	$AnimatedSprite2D.animation = "Walk"
	$AnimatedSprite2D.flip_h = false

func _on_right_button_button_up():
	can_move = false
