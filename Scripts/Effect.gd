extends AnimatedSprite


func _ready():
	connect("animation_finished", self, "_on_animation_finished")

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		play("Animate")

func _on_animation_finished():
	queue_free()
