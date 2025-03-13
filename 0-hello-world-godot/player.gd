extends CharacterBody2D

var speed = 300.0
var jump_speed = -500.0
# Pega a gravidade das configurações do projeto
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Aplica a gravidade
	velocity.y += gravity * delta

	# Verifica o input horizontal
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# Lógica de animação e flip do sprite
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")  # Substitua "walk" pelo nome da sua animação
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")  # Substitua "walk" pelo nome da sua animação
	else:
		$AnimatedSprite2D.stop()

	# Verifica o pulo
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		$SoundJump.play()
		velocity.y = jump_speed

	# Aplica o movimento
	move_and_slide()
