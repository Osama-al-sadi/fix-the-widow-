extends Area2D

var fixed = false
var player_near = false
var ok = false
var odb=0
func _process(delta):
	if player_near and Input.is_action_just_pressed("fix"):
		fix_window()
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()
		pass
		if odb == 6:
			ok = true
			pass
		if ok == true:
			get_tree().change_scene("res://man menio win.tscn")
			pass
func _on_window_body_entered(body):
	if body.is_in_group("player"):
		player_near = true

func _on_window_body_exited(body):
	if body.is_in_group("player"):
		player_near = false

func fix_window():
	if fixed:
		return
	
	fixed = true
	$animition.play()
	

