import pacientes.*

class Aparato {
	var color = "blanco"
	
	method puedeSerUsadoEn(unPaciente) = true
	
	method valorQueSumaAFortalezaDe(unPaciente) = 0
	
	method valorQueRestaADolorDe(unPaciente) = 0
	
	method color() = color
	
	method efectosDeUsoEn(unPaciente)
	
	method nesesitaMantenimiento()
	
	method mantenimiento()
}

class Magneto inherits Aparato {
	var inmantacion = 800
	
	override method efectosDeUsoEn(unPaciente) {
		inmantacion -= 1
	}
	
	override method nesesitaMantenimiento() = inmantacion < 100
	
	override method mantenimiento() {
		if(self.nesesitaMantenimiento()) {
			inmantacion += 500
		}
	}
	
	override method valorQueRestaADolorDe(unPaciente) = unPaciente.dolor() * 0.1
}



class Bicicleta inherits Aparato {
	var cantDeVecesQueSeDesajustantornillos = 0
	var cantDeVecesQuePierdeAceite = 0
	
	override method efectosDeUsoEn(unPaciente) {
		if(unPaciente.dolor() > 30) {
			cantDeVecesQueSeDesajustantornillos += 1
		}
		if(unPaciente.edad().between(29, 51)) {
			cantDeVecesQuePierdeAceite += 1
		}
	}
	
	override method nesesitaMantenimiento() = cantDeVecesQueSeDesajustantornillos >= 10 or cantDeVecesQuePierdeAceite >= 5
	
	override method mantenimiento() {
		if(self.nesesitaMantenimiento()) {
			cantDeVecesQueSeDesajustantornillos -= cantDeVecesQueSeDesajustantornillos 
			cantDeVecesQuePierdeAceite -= cantDeVecesQuePierdeAceite
		}
	}
	
	override method puedeSerUsadoEn(unPaciente) = unPaciente.edad() > 8
	
	override method valorQueRestaADolorDe(unPaciente) = 4
	
	override method valorQueSumaAFortalezaDe(unPaciente) = 3
}



class Minitramp inherits Aparato {
	
	override method efectosDeUsoEn(unPaciente) = null
	
	override method nesesitaMantenimiento() = false
	
	override method mantenimiento() = null
	
	override method puedeSerUsadoEn(unPaciente) = unPaciente.dolor() < 20
	
	override method valorQueSumaAFortalezaDe(unPaciente) = unPaciente.edad() * 0.1
}