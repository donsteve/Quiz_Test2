extends Node


var counterhangedgame
var vidas_jugador = 5
var time_left = 60
var tiempo = 0
var puntajeglobal = 0
var turno = true
var pnivel1 
var pnivel2 
var pnivel3 
var pnivel4 
var pnivel5
var pnivel6 
var pnivel7 
var pnivel8
var pnivel9
#puntaje inicial de los minijuegos
const puntajeahorcado = 500
var puntos = 0
#variables para saber si el nivel esta pasado o no, ej: no poder ingresar a nivel 2 sin pasar nivel 1
var level1 = false
var level2 = false
var level3 = false
var level4 = false
var level5 = false
var level6 = false
var level7 = false
var level8 = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_vidas():
	get_tree().get_nodes_in_group("vidasjugador")[0].text = String(vidas_jugador)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo) 


func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)