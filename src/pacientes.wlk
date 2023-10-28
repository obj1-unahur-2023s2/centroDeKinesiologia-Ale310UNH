import aparatos.*

class Paciente {
	const property edad
	var fortalezaMuscular
	var dolor
	const property rutina = []
	
	method fortalezaMuscular() = fortalezaMuscular
	method dolor() = dolor
	
	method puedeUsar(unAparato) {
		return unAparato.puedeSerUsadoEn(self)
	}
	
	method usarAparato(aparato) {
		if(not self.puedeUsar(aparato)) {
			self.error("El paciente no puede usar el aparato")
		}
		aparato.efectosDeUsoEn(self)
		fortalezaMuscular += aparato.valorQueSumaAFortalezaDe(self)
		dolor = 0.max(dolor - aparato.valorQueRestaADolorDe(self))
	}
	
	method agregarRutina(unaRutina) {
		rutina.addAll(unaRutina)
	}
	
	method puedeRealizarRutina() = rutina.all({a => self.puedeUsar(a)})
	
	method realizarSesionCompleta() {
		rutina.forEach({a => self.usarAparato(a)})
	}
}

class PacienteResistente inherits Paciente {
	
	override method realizarSesionCompleta() {
		super()
		fortalezaMuscular += rutina.size()
	}
}

class PacienteCaprichoso inherits Paciente {
	
	method hayAparatoColorRojoEnLARutina() = rutina.any({a => a.color() == "rojo"})
	
	override method puedeRealizarRutina() = super() and self.hayAparatoColorRojoEnLARutina()
	
	override method realizarSesionCompleta() {
		if(self.puedeRealizarRutina()) {
			super()
			super()
		}
	}
}

class PacienteRapidaRecuperacion inherits Paciente {
	var cantidadDeDolorDecrementado = 3
	
	method cacantidadDeDolorDecrementado(unaCantidad) {
		cantidadDeDolorDecrementado = unaCantidad
	}
	
	override method realizarSesionCompleta() {
		super()
		dolor = 0.max(dolor - cantidadDeDolorDecrementado)
	}
}