extends Node

export(Resource) var bd_quiz
export(Resource) var bd_quiz_2
export(Resource) var bd_quiz_3
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
	if Gamehandler.niv_quiz == 2:
		quiz_shuffle = randomize_array(bd_quiz.bd)
		Gamehandler.puntos = 0
		Gamehandler.npregunta = 0 
		Gamehandler.update_puntos()
		load_quiz()
	elif Gamehandler.niv_quiz == 5:
		quiz_shuffle = randomize_array(bd_quiz_2.bd)
		Gamehandler.puntos = 0
		Gamehandler.npregunta = 0
		Gamehandler.update_puntos()
		load_quiz()
	elif Gamehandler.niv_quiz == 8:
		quiz_shuffle = randomize_array(bd_quiz_3.bd)
		Gamehandler.puntos = 0
		Gamehandler.npregunta = 0
		Gamehandler.update_puntos()
		load_quiz()	
	
	
	


#FUNCION QUE CARGA LAS DISTINTAS PREGUNTAS SEGUN EL NIVEL
func load_quiz() -> void:	
#######################AQUI SE CARGAN PREGUNTAS DEL NIVEL 2#########################################
	if Gamehandler.niv_quiz == 2:
		if index >= bd_quiz.bd.size():
			if Gamehandler.puntos <= 199:
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

#######################AQUI SE CARGAN PREGUNTAS DEL NIVEL 5#########################################

	elif Gamehandler.niv_quiz == 5:
		if index >= bd_quiz_2.bd.size():
			if Gamehandler.puntos <= 199:
				#mostrar ventana que perdio
				_perdiste_por_puntos()	
			else:
				#asignar puntaje a puntaje global
				#mostrar ventana que gano
				_on_Letters_youwin_quiz_5()			
							
			return
				
		#randomiza el orden de las preguntas
		question_texts.text = str(quiz_shuffle[index].question_info)
		
		#randomiza el orden de las respuestas
		var options = randomize_array(bd_quiz_2.bd[index].options)
		randomize()
		options.shuffle()
		
		for i in buttons.size():
			buttons[i].text = str(options[i])
			buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])

#######################AQUI SE CARGAN PREGUNTAS DEL NIVEL 3#########################################
#######################AQUI SE CARGAN PREGUNTAS DEL NIVEL 8#########################################

	elif Gamehandler.niv_quiz == 8:
		if index >= bd_quiz_3.bd.size():
			if Gamehandler.puntos <= 199:
				#mostrar ventana que perdio
				_perdiste_por_puntos()	
			else:
				#asignar puntaje a puntaje global
				#mostrar ventana que gano
				_on_Letters_youwin_quiz_8()			
							
			return
				
		#randomiza el orden de las preguntas
		question_texts.text = str(quiz_shuffle[index].question_info)
		
		#randomiza el orden de las respuestas
		var options = randomize_array(bd_quiz_3.bd[index].options)
		randomize()
		options.shuffle()
		
		for i in buttons.size():
			buttons[i].text = str(options[i])
			buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])

####################################################################################################
	
#FUNCION DE LOS BOTONES  DONDE SE VALIDA AL SELECCIONAR UNA PREGUNTA
func buttons_answer(button) -> void:
#aqui se valida el tiempo y se asigna el puntaje de acuerdo al t° de respuesta
	if Gamehandler.niv_quiz == 2:    
		if Gamehandler.tiempo <= 12:
			if bd_quiz.bd[index].correct == button.text:
				Gamehandler.puntos += 100
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_wrong
				
		elif Gamehandler.tiempo > 12: 
			if bd_quiz.bd[index].correct == button.text:
				Gamehandler.puntos += 40
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
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

#######################SE VALIDA EL PUNTAJE Y SE PASA A LA SIGUIENTE PREGUNTA LVL 5#########################################
	elif Gamehandler.niv_quiz == 5:    
		if Gamehandler.tiempo <= 12:
			if bd_quiz_2.bd[index].correct == button.text:
				Gamehandler.puntos += 100
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_wrong
				
		elif Gamehandler.tiempo > 12: 
			if bd_quiz_2.bd[index].correct == button.text:
				Gamehandler.puntos += 40
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
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
##########################################################################################################
#######################SE VALIDA EL PUNTAJE Y SE PASA A LA SIGUIENTE PREGUNTA LVL 8#########################################
	elif Gamehandler.niv_quiz == 8:    
		if Gamehandler.tiempo <= 12:
			if bd_quiz_3.bd[index].correct == button.text:
				Gamehandler.puntos += 100
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_wrong
				
		elif Gamehandler.tiempo > 12: 
			if bd_quiz_3.bd[index].correct == button.text:
				Gamehandler.puntos += 40
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
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
###################################################################################################



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
		
func _on_Letters_youwin_quiz_5():
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("ganaste")
	if(Gamehandler.puntos > Gamehandler.pnivel5):
		Gamehandler.pnivel5 = Gamehandler.puntos		

func _on_Letters_youwin_quiz_8():
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("ganaste")
	if(Gamehandler.puntos > Gamehandler.pnivel8):
		Gamehandler.pnivel8 = Gamehandler.puntos
		
		
func _perdiste_por_puntos():
	Gamehandler.perder_vida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("perdiste por puntos")
