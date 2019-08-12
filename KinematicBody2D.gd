extends KinematicBody2D
const UP=Vector2(0,-1)
var motion = Vector2()
const gravity = 30
const acceleration = 50
const max_speed = 300
const height = 600



func _physics_process(delta):
	motion.y+=gravity
	var friction = 0
	if Input.is_action_pressed("ui_right"):
		motion.x += acceleration
		print("x is ",motion.x)
		motion.x = min(motion.x,max_speed) # return the smaller one among these two 
		$Sprite.flip_h=0	
		$Sprite.play("flying")
		
	elif Input.is_action_pressed("ui_left"):
		motion.x -= acceleration
		motion.x = max(motion.x,-max_speed) # return the larger value among these two 
		print("y is ",motion.x)
		
		$Sprite.flip_h=1
		$Sprite.play("flying")
		
	else:
		$Sprite.play("idle")
		friction = 1
		
	if is_on_floor():
	#	print("it is on floor")
		if(Input.is_action_just_pressed("ui_up")):
			motion.y=-height
		if friction==1:
			motion.x = lerp(motion.x,0, 0.2 )# reduce speed from motion.x(running speed) to 0(standing state) by 20% every frame
	
	else:   # in air
		if motion.y<0:	
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
			
		if friction==1:	
			motion.x = lerp(motion.x , 0, 0.05)
	motion=move_and_slide(motion,UP)
	pass
