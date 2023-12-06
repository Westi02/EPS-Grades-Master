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
	_calculate_rating_gesamt()
	
func _calculate_rating_teil2():
	var pointsP1 = $ColorRectTeil2/PunkteLabelP1/InputPunkteTeil2P1.text
	var factorP1 = $ColorRectTeil2/FaktorLabelP1/InputFaktorTeil2P1.text
	
	var pointsP2 = $ColorRectTeil2/PunkteLabelP2/InputPunkteTeil2P2.text
	var factorP2 = $ColorRectTeil2/FaktorLabelP2/InputFaktorTeil2P2.text
	
	var pointsP3 = $ColorRectTeil2/PunkteLabelP3/InputPunkteTeil2P3.text
	var factorP3 = $ColorRectTeil2/FaktorLabelP3/InputFaktorTeil2P3.text
	
	if pointsP1.is_valid_int():
		pointsP1 = pointsP1.to_int()
		
	if factorP1.is_valid_int():
		factorP1 = factorP1.to_int()
	
	if pointsP2.is_valid_int():
		pointsP2 = pointsP2.to_int()
		
	if factorP2.is_valid_int():
		factorP2 = factorP2.to_int()
	
	if pointsP3.is_valid_int():
		pointsP3 = pointsP3.to_int()
		
	if factorP3.is_valid_int():
		factorP3 = factorP3.to_int()
	
	for value in [pointsP1, pointsP2, pointsP3, factorP1, factorP2, factorP3]:
		if not typeof(value) == TYPE_INT:
			$ColorRectTeil2/ErgebnisLabelTitel/ErgebnisLabelTeil2.text = "ERROR"
			return
	
	var result1 = _calculatePointsFactorResult(pointsP1, factorP1)
	var result2 = _calculatePointsFactorResult(pointsP2, factorP2)
	var result3 = _calculatePointsFactorResult(pointsP3, factorP3)
	
	var result = (result1 + result2 + result3)
	$ColorRectTeil2/ErgebnisLabelTitel/ErgebnisLabelTeil2.text = str(result)
	_calculate_rating_gesamt()
	
func _calculate_rating_teil3():
	var pointsP1 = $ColorRectProjektarbeit/PunkteLabelDoku/InputPunkteDoku.text
	var factorP1 = $ColorRectProjektarbeit/FaktorLabelDoku/InputFaktorDoku.text
	
	var pointsP2 = $ColorRectProjektarbeit/PunkteLabelPraesentation/InputPunktePraesentation.text
	var factorP2 = $ColorRectProjektarbeit/FaktorLabelPraesentation/InputFaktorPraesentation.text

	
	if pointsP1.is_valid_int():
		pointsP1 = pointsP1.to_int()
		
	if factorP1.is_valid_int():
		factorP1 = factorP1.to_int()
	
	if pointsP2.is_valid_int():
		pointsP2 = pointsP2.to_int()
		
	if factorP2.is_valid_int():
		factorP2 = factorP2.to_int()
	
	for value in [pointsP1, pointsP2, factorP1, factorP2]:
		if not typeof(value) == TYPE_INT:
			$ColorRectProjektarbeit/ErgebnisLabelTitel/ErgebnisLabelProjektarbeit.text = "ERROR"
			return
	
	var result1 = _calculatePointsFactorResult(pointsP1, factorP1)
	var result2 = _calculatePointsFactorResult(pointsP2, factorP2)
	
	var result = (result1 + result2)
	$ColorRectProjektarbeit/ErgebnisLabelTitel/ErgebnisLabelProjektarbeit.text = str(result)	
	_calculate_rating_gesamt()
	
func _calculate_rating_gesamt():
	var pointsTeil1 = $ColorRectTeil1/ErgebnisLabelTitel/ErgebnisLabelTeil1.text
	var pointsTeil2 = $ColorRectTeil2/ErgebnisLabelTitel/ErgebnisLabelTeil2.text
	var pointsTeil3 = $ColorRectProjektarbeit/ErgebnisLabelTitel/ErgebnisLabelProjektarbeit.text
	
	if pointsTeil1.is_valid_int():
		pointsTeil1 = pointsTeil1.to_int()
		
	if pointsTeil2.is_valid_int():
		pointsTeil2 = pointsTeil2.to_int()
	
	if pointsTeil3.is_valid_int():
		pointsTeil3 = pointsTeil3.to_int()
		
	for value in [pointsTeil1, pointsTeil2, pointsTeil3]:
		if not typeof(value) == TYPE_INT:
			$ColorRectGesamt/GesamtpunkteTitel/GesamtpunkteLabel.text = "ERROR"
			return
		
	var result = int(round((pointsTeil1 + pointsTeil2 + pointsTeil3) / 100))
	$ColorRectGesamt/GesamtpunkteTitel/GesamtpunkteLabel.text = str(result)	
	$ColorRectGesamt/NoteTitel/NoteLabel.text = str(_calculate_note_gesamt(result))	
	
func _calculate_note_gesamt(punkte):
	if punkte >= 92:
		return 1
	elif punkte >= 81:
		return 2
	elif  punkte >= 67:
		return 3
	elif punkte >= 50:
		return 4
	elif punkte >= 30:
		return 5
	elif punkte >= 0:
		return 6
	else:
		return "ERROR"
	
func _calculatePointsFactorResult(points, factor):
	return points * factor


func _on_input_punkte_teil_1_text_changed(new_text):
	_calculate_rating_teil1()

func _on_input_faktor_teil_1_text_changed(new_text):
	_calculate_rating_teil1()


func _on_input_punkte_teil_2p_1_text_changed(new_text):
	_calculate_rating_teil2()


func _on_input_faktor_teil_2p_1_text_changed(new_text):
	_calculate_rating_teil2()


func _on_input_punkte_teil_2p_2_text_changed(new_text):
	_calculate_rating_teil2()


func _on_input_faktor_teil_2p_2_text_changed(new_text):
	_calculate_rating_teil2()


func _on_input_punkte_teil_2p_3_text_changed(new_text):
	_calculate_rating_teil2()


func _on_input_faktor_teil_2p_3_text_changed(new_text):
	_calculate_rating_teil2()


func _on_input_punkte_doku_text_changed(new_text):
	_calculate_rating_teil3()


func _on_input_faktor_doku_text_changed(new_text):
	_calculate_rating_teil3()


func _on_input_punkte_praesentation_text_changed(new_text):
	_calculate_rating_teil3()


func _on_input_faktor_praesentation_text_changed(new_text):
	_calculate_rating_teil3()
