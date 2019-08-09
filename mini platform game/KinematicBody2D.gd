extends KinematicBody2D
const UP=Vector2(0,-1)
var motion = Vector2()
const gravity = 30
const speed = 300
const height = 600



func _physics_process(delta):
	motion.y+=gravity
	if Input.is_action_pressed("ui_right"):
		motion.x=speed
		$Sprite.flip_h=0
		$Sprite.play("flying")
		
		
	elif Input.is_action_pressed("ui_left"):
		motion.x=-speed
		$Sprite.flip_h=1
		$Sprite.play("flying")
		
		
		
	else:
		$Sprite.play("idle")
		motion.x=0
		
	if is_on_floor():
		print("it is on floor")
		if(Input.is_action_just_pressed("ui_up")):
			motion.y=-height
	else:
		$Sprite.play("jump")
		
	motion=move_and_slide(motion,UP)
	pass
