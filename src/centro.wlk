import aparatos.*
import pacientes.*

object centro {
	const property aparatos = #{}
	const property pacientes = #{}
	
	
	method agregarAparatos(conjuntoDeAparatos) {
		aparatos.addAll(conjuntoDeAparatos)
	}
	method agregarPacientes(conjuntoDePacientes) {
		pacientes.addAll(conjuntoDePacientes)
	}
	
	method coloresDeAparatos() = aparatos.map({a => a.color()}).asSet()
	
	method pacientesMenoresA8Anios() = pacientes.filter({p => p.edad() < 8})
	
	method pacientesQueNoPuedenRealizarSuSesion() = pacientes.count({p => not p.puedeRealizarRutina()})
	
	method estaEnOptmiasCondiciones() = aparatos.all({a => not a.nesesitaMantenimiento()})
	
	method estaComplicado() = aparatos.count({a => a.nesesitaMantenimiento()}) >= aparatos.size() / 5
	
	method visitaDeTecnico() {
		aparatos.forEach({a => a.mantenimiento()})
	}
}
