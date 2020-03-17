extends KinematicBody2D



const FLOOR_NORMAL = Vector2.UP

export var speed = Vector2(300, 1000)
export var gravity = 4000
export var score = 100

var velocity = Vector2.ZERO

func _ready():
	set_physics_process(false)
	velocity.x = -speed.x
	$walkTime.wait_time = randi() % 3 + 1
	
func _physics_process(delta):
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y

func _on_walkTime_timeout():
	velocity.x = -velocity.x
	$walkTime.start()


func _on_StompNotice_body_entered(body):
	if body.global_position.y > get_node("StompNotice").global_position.y:
		return 
	queue_free()
	PlayerData.score += score
