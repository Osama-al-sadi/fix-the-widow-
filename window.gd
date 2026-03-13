extends Area2D # لا تخاف تقريبا عامل كل حاجة

var fixed = false
var player_near = false
var ok = false
var fixed widow = 0 # كل ما يصلح شباك = نقطة
func _process(delta):
	if player_near and Input.is_action_just_pressed("fix"):#input "fix" = f(زر)الحرف 
		fix_window()
	if Input.is_action_pressed("reset"):#input "reset =  r (زر)الحرف
		get_tree().reload_current_scene()
		pass
		if fixed widow == 6:
			ok = true
			pass
		if ok == true:
			get_tree().change_scene("res://man menio win.tscn") #man menio win.tscn = قاىءمة الفوز
			pass
func _on_window_body_entered(body):
	if body.is_in_group("player"): #  "player" اله غروب اسمه  ="player"ال
		player_near = true

func _on_window_body_exited(body):
	if body.is_in_group("player"):
		player_near = false

func fix_window():
	if fixed:
		return
	
	fixed = true
	$animition.play()
	

