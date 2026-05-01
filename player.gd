extends Area2D
signal hit()

@export var speed = 4000
var screen_size 

func _ready() -> void:
	screen_size = get_viewport_rect().size
	show()
	

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("space"):
		$"../HUD"._on_start_button_pressed()
	if Input.is_action_pressed("jalan_kanan"):
		velocity.x += 1
	if Input.is_action_pressed("jalan_bawah"):
		velocity.y += 1
	if Input.is_action_pressed("jalan_kiri"):
		velocity.x += -1
	if Input.is_action_pressed("jalan_atas"):
		velocity.y += -1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO,screen_size)
	
	if velocity.x != 0 :
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0 :
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0
		
func _on_body_entered(body: Node2D) -> void:
	hide() 
	hit.emit()
	$CollisionShape2D.set_deferred("disabled",false)
	

	
	
	
