extends KinematicBody2D
var knockback = Vector2.ZERO

onready var stats = $EnemyStats

func _ready():
	print(stats.health)

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

func _on_Hurtbox_area_entered(area):
	stats.health -= area.hit_points
	knockback = area.knockback_vector * 120

func _on_EnemyStats_no_health():
	queue_free()
