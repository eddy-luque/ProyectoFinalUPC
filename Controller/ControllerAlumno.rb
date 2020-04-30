require_relative '../Factory/FactoryPreguntaConRespuesta'
require_relative '../Factory/FactoryExamen'
require_relative '../Factory/FactoryAlternativa'
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
			f = FactoryPreguntaConRespuesta.create(pregunta.pregunta, pregunta.tipoExamen)
			elNuevoOrden = pregunta.alternativas.shuffle
			for j in 0...elNuevoOrden.size
				letra = (j+97).chr
				fA = FactoryAlternativa.create([letra,elNuevoOrden[j].alternativa])
				f.registrarAlternativa(fA)
				if elNuevoOrden[j].codigo == pregunta.respuestaCorrecta
					f.respuestaCorrecta = letra
				end
			end
			respuesta = vista.solicitarRespuesta(f, "#{i + 1}. ",mcaAdmision)
			f.respuesta = respuesta
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