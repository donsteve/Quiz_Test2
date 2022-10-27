extends Node


var counterhangedgame
var vidas_jugador = 5
var time_left = 60
var tiempo = 0
var npregunta = 0
# Luego de pasados 4 minutos desde la pérdida de una vida se repondrá la vida perdida.
var life_recharge = 20
var puntajeglobal = 0
var turno = true
# para probar que funcionan las estrellas
var pnivel1 = 0
var pnivel2 = 0
var pnivel3 = 0
var pnivel4 = 0
var pnivel5 = 0
var pnivel6 = 0
var pnivel7 = 0
var pnivel8 = 0
var pnivel9 = 0
#puntaje inicial de los minijuegos
const puntajeahorcado = 500
var puntos = 0
#variables para saber si el nivel esta pasado o no, ej: no poder ingresar a nivel 2 sin pasar nivel 1
var level1 = true
var level2 = false
var level3 = false
var level4 = false
var level5 = false
var level6 = false
var level7 = false
var level8 = false
#valida que bd de preguntas se cargaran para quiz y cyd
var niv_quiz = 0
var niv_cyd = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func recharge_life():
	if(vidas_jugador < 5):
		print(vidas_jugador)
		relojderecargarvidas()

func update_vidas():
	get_tree().get_nodes_in_group("vidasjugador")[0].text = String(vidas_jugador)

func relojderecargarvidas():
	get_tree().get_nodes_in_group("vida_maxima")[0].text = String(life_recharge)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo) 
	
func disminuir_tiempo():
	get_tree().get_nodes_in_group("tiempo_left")[0].text = String(time_left/60) + ":" + String(time_left%60)

func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)
	
#########Esta funcion actualiza el numero de pregunta en pantalla###########################
func update_npregunta():
	get_tree().get_nodes_in_group("npregunta")[0].text = String(npregunta)	
	
func perder_vida():
	Gamehandler.vidas_jugador -= 1

func _on_top_bar_minigames_seacaboeltiempo():
	perder_vida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	#emit_signal("game_over")
	print("se te acabo el tiempo")
