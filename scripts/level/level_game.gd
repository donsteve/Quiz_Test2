extends Node

export(Resource) var bd_quiz
export(Color) var color_right
export(Color) var color_wrong

var buttons := []
var index := 0
var quiz_shuffle := []

onready var question_texts := $question_info/txt_question

func _ready() -> void:
	for _button in $question_holder.get_children():
		buttons.append(_button)

	quiz_shuffle = randomize_array(bd_quiz.bd)
	load_quiz()


#carga las preguntas del quiz
func load_quiz() -> void:
	if index >= bd_quiz.bd.size():
		print("termino el juego") #aca agregar funcion que muestre estrellas y puntaje
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
	if bd_quiz.bd[index].correct == button.text:
			button.modulate = color_right
	else:
		button.modulate = color_wrong

	yield(get_tree().create_timer(1), "timeout")
	for bt in buttons:
		bt.modulate = Color.white
		bt.disconnect("pressed", self, "buttons_answer")
	
	index += 1
	load_quiz()
	




func randomize_array(array: Array) -> Array:
	randomize()
	var array_temp := array
	array_temp.shuffle()
	return array_temp
