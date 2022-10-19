extends Node

export(Resource) var bd_quiz
export(Color) var color_right
export(Color) var color_wrong

var buttons := []
var index := 0
var quiz_shuffle := []

onready var question_texts := $question_info/txt_question


#func perder_vida():
	#Gamehandler.vidas_jugador -= 1

#carga el juego 
func _ready() -> void:
	for _button in $question_holder.get_children():
		buttons.append(_button)
	Gamehandler.time_left = 60	
	#Gamehandler.disminuir_tiempo()
	quiz_shuffle = randomize_array(bd_quiz.bd)
	Gamehandler.puntos = 0
	Gamehandler.update_puntos()
	
	load_quiz()
	
	
	
	


#carga los distintas preguntas
func load_quiz() -> void:
	if index >= bd_quiz.bd.size():
		if Gamehandler.puntos <= 299:
			#mostrar ventana que perdio
			_perdiste_por_puntos()	
		else:
			#asignar puntaje a puntaje global
			#mostrar ventana que gano
			_on_Letters_youwin_quiz()			
						
		return
	
		
	
	
	#randomiza el orden de las preguntas
	question_texts.text = str(quiz_shuffle[index].question_info)
	
	#randomiza el orden de las respuestas
	var options = randomize_array(bd_quiz.bd[index].options)
	randomize()
	options.shuffle()
	
	for i in buttons.size():
		buttons[i].text = str(options[i])
		buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])
	

#valida que la respuesta seleccionada sea correcta o incorrecta y pasa a la sgte pregunta
func buttons_answer(button) -> void:
	#aqui se valida el tiempo y se asigna el puntaje de acuerdo al t° de respuesta
	if Gamehandler.tiempo <= 12:
		if bd_quiz.bd[index].correct == button.text:
			Gamehandler.puntos += 100
			Gamehandler.update_puntos()
			button.modulate = color_right
		else:
			Gamehandler.puntos += 0
			Gamehandler.update_puntos()
			button.modulate = color_wrong
			
	elif Gamehandler.tiempo > 12: 
		if bd_quiz.bd[index].correct == button.text:
			Gamehandler.puntos += 40
			Gamehandler.update_puntos()
			button.modulate = color_right
		else:
			Gamehandler.puntos += 0
			Gamehandler.update_puntos()
			button.modulate = color_wrong					 		
			

		

	yield(get_tree().create_timer(1), "timeout")
	for bt in buttons:
		bt.modulate = Color.white
		bt.disconnect("pressed", self, "buttons_answer")
	
	index += 1
	Gamehandler.tiempo = 0
	load_quiz()
	
	#funcion mandar puntaje total del usuario
	#funcion mostrar pantalla paso nivel o perdio



func randomize_array(array: Array) -> Array:
	randomize()
	var array_temp := array
	array_temp.shuffle()
	return array_temp


func _on_Timer_timeout():
	Gamehandler.tiempo += 1
	Gamehandler.update_time()
	

func _on_top_bar_minigames_seacaboeltiempo():
	Gamehandler.perder_vida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	#emit_signal("game_over")
	print("se te acabo el tiempo")
	
func _on_Letters_youwin_quiz():
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("ganaste")
	if(Gamehandler.puntos > Gamehandler.pnivel2):
		Gamehandler.pnivel2 = Gamehandler.puntos
		
func _perdiste_por_puntos():
	Gamehandler.perder_vida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("perdiste por puntos")
