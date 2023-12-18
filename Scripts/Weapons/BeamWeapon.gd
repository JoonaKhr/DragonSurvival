extends "../Base/BaseWeapon.gd"

@export var damage: int
var targeted_enemy

func get_damage():
	return damage

func draw_beam():
	var beam = Line2D.new()
	enemies = get_enemies()
	targeted_enemy = enemies[randi_range(0, enemies.size()-1)]
	beam.add_point(player.position)
	beam.add_point(targeted_enemy.position)
	beam.add_child(setup_beam_timer(beam))
	return beam

func setup_beam_timer(beam):
	var deathTimer = Timer.new()
	deathTimer.wait_time = 0.2
	deathTimer.autostart = true
	deathTimer.timeout.connect(func():beam.queue_free())
	return deathTimer

func spawn_projectiles(_enemies, _i):
	get_tree().get_root().add_child(draw_beam())
	targeted_enemy.hit.emit(self)
