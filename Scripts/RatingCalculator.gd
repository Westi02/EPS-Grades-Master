extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _calculate_rating_teil1():
	var points = $ColorRectTeil1/PunkteLabel/InputPunkteTeil1.text
	var factor = $ColorRectTeil1/FaktorLabel/InputFaktorTeil1.text
	
	if points.is_valid_int():
		points = points.to_int()
		
	if factor.is_valid_int():
		factor = factor.to_int()
	
	for value in [points, factor]:
		if not typeof(value) == TYPE_INT:
			$ColorRectTeil1/ErgebnisLabelTitel/ErgebnisLabelTeil1.text = "ERROR"
			return
	
	var result = _calculatePointsFactorResult(points, factor)
	$ColorRectTeil1/ErgebnisLabelTitel/ErgebnisLabelTeil1.text = str(result)
	
func _calculate_rating_teil2():
	pass
	
func _calculate_rating_projektarbeit():
	pass
	
func _calculate_rating_gesamt():
	pass
	
func _calculatePointsFactorResult(points, factor):
	return points * factor



func _on_input_punkte_teil_1_text_changed(new_text):
	_calculate_rating_teil1()

func _on_input_faktor_teil_1_text_changed(new_text):
	_calculate_rating_teil1()
