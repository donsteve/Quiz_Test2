extends Node

export(Resource) var bd_cyd
export(Resource) var bd_cyd2
export(Resource) var bd_cyd3
export(Texture) var color_right
export(Texture) var color_wrong

var buttons := []
var index := 0
var quiz_shuffle := []

onready var question_texts := $question_info/txt_question


#############################CARGA EL JUEGO########################################################## 
func _ready() -> void:
	for _button in $question_holder.get_children():
		buttons.append(_button)
	Gamehandler.time_left = 60	
	#Gamehandler.disminuir_tiempo()
	if Gamehandler.niv_cyd == 3:
		quiz_shuffle = randomize_array(bd_cyd.bd)
		Gamehandler.puntos = 0
		Gamehandler.update_puntos()
		load_quiz()
	elif Gamehandler.niv_cyd == 6:
		quiz_shuffle = randomize_array(bd_cyd2.bd)
		Gamehandler.puntos = 0
		Gamehandler.update_puntos()
		load_quiz()
	elif Gamehandler.niv_cyd == 9:
		quiz_shuffle = randomize_array(bd_cyd3.bd)
		Gamehandler.puntos = 0
		Gamehandler.update_puntos()
		load_quiz()	


#####################################################################################################

func load_quiz() -> void:

		if Gamehandler.niv_cyd == 3:
			if index >= bd_cyd.bd.size():
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
			var options = randomize_array(bd_cyd.bd[index].options)
			randomize()
			options.shuffle()
	
	
			for i in buttons.size():
				buttons[i].texture_normal = options[i]
				buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])
	
#######################################################################################################	
		elif Gamehandler.niv_cyd == 6:
			if index >= bd_cyd2.bd.size():
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
			var options = randomize_array(bd_cyd2.bd[index].options)
			randomize()
			options.shuffle()
	
	
			for i in buttons.size():
				buttons[i].texture_normal = options[i]
				buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])
	
######################################################################################################	
		elif Gamehandler.niv_cyd == 9:
			if index >= bd_cyd3.bd.size():
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
			var options = randomize_array(bd_cyd3.bd[index].options)
			randomize()
			options.shuffle()
	
	
			for i in buttons.size():
				buttons[i].texture_normal = options[i]
				buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])
####################################################################################################	
	
####################################################################################################	
#valida que la respuesta seleccionada sea correcta o incorrecta y pasa a la sgte pregunta
func buttons_answer(button) -> void:
	#aqui se valida el tiempo y se asigna el puntaje de acuerdo al t° de respuesta
	if Gamehandler.niv_cyd == 3: 
		if Gamehandler.tiempo <= 12:
			if bd_cyd.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 100
				Gamehandler.update_puntos()
				button.texture_normal = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.update_puntos()
				button.texture_normal = color_wrong
				
		elif Gamehandler.tiempo > 12: 
			if bd_cyd.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 40
				Gamehandler.update_puntos()
				button.texture_normal = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.update_puntos()
				button.texture_normal = color_wrong					 		
				

			

		yield(get_tree().create_timer(1), "timeout")
		for bt in buttons:
			bt.modulate = Color.white
			bt.disconnect("pressed", self, "buttons_answer")
		
		index += 1
		Gamehandler.tiempo = 0
		load_quiz()
	
	#funcion mandar puntaje total del usuario
	#funcion mostrar pantalla paso nivel o perdio
	
##########################SE MUESTRAN DE LAS IMG NV6################################################

	if Gamehandler.niv_cyd == 6: 
		if Gamehandler.tiempo <= 12:
			if bd_cyd2.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 100
				Gamehandler.update_puntos()
				button.texture_normal = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.update_puntos()
				button.texture_normal = color_wrong
				
		elif Gamehandler.tiempo > 12: 
			if bd_cyd2.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 40
				Gamehandler.update_puntos()
				button.texture_normal = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.update_puntos()
				button.texture_normal = color_wrong					 		
				

			

		yield(get_tree().create_timer(1), "timeout")
		for bt in buttons:
			bt.modulate = Color.white
			bt.disconnect("pressed", self, "buttons_answer")
		
		index += 1
		Gamehandler.tiempo = 0
		load_quiz()
	
	#funcion mandar puntaje total del usuario
	#funcion mostrar pantalla paso nivel o perdio
	
######################################SE MUESTRA DEL NV9########################################

	if Gamehandler.niv_cyd == 9: 
		if Gamehandler.tiempo <= 12:
			if bd_cyd3.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 100
				Gamehandler.update_puntos()
				button.texture_normal = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.update_puntos()
				button.texture_normal = color_wrong
				
		elif Gamehandler.tiempo > 12: 
			if bd_cyd3.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 40
				Gamehandler.update_puntos()
				button.texture_normal = color_right
			else:
				Gamehandler.puntos += 0
				Gamehandler.update_puntos()
				button.texture_normal = color_wrong					 		
				

			

		yield(get_tree().create_timer(1), "timeout")
		for bt in buttons:
			bt.modulate = Color.white
			bt.disconnect("pressed", self, "buttons_answer")
		
		index += 1
		Gamehandler.tiempo = 0
		load_quiz()
	
	#funcion mandar puntaje total del usuario
	#funcion mostrar pantalla paso nivel o perdio
	
#####################################################################################################


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
	if(Gamehandler.puntos > Gamehandler.pnivel3):
		Gamehandler.pnivel3 = Gamehandler.puntos
		
func _perdiste_por_puntos():
	Gamehandler.perder_vida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("perdiste por puntos")

