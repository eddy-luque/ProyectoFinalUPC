require_relative '../Factory/FactoryPreguntaConRespuesta'
require_relative '../Factory/FactoryExamen'
class ControllerAlumno
	attr_accessor :vista, :modelo, :modeloAdm
	def initialize(vista, modelo, modeloAdm)
		@vista, @modelo, @modeloAdm = vista, modelo, modeloAdm
	end

	def procesarExamen(mcaAdmision)
		examen = modeloAdm.generarExamen
		ptos = examen[0].calcularPuntos
		examenDesarrollado = []
		if mcaAdmision
			vista.mostrarEnunciado(ptos)
		else
			vista.mostrarEnunciado(ptos,"SIMULACRO")
		end
		for i in 0...examen.size
			pregunta = examen[i]
			respuesta = vista.solicitarRespuesta(pregunta, "#{i + 1}. ")
			f = FactoryPreguntaConRespuesta.create(pregunta, respuesta)
			examenDesarrollado.push(f)
		end
		fe = FactoryExamen.create(mcaAdmision,examenDesarrollado)
		modelo.registrarExamen(fe)
		nota = fe.calcularNota
		vista.mostrarResultado(nota)
		if vista.mostrarMenuPostExamen == 1
			vista.verResumenExamen(fe)
		end
	end
end