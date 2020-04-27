class Administrador
	attr_accessor :alumnos, :preguntas
	def initialize()
		@alumnos = []
		@preguntas = []
	end

	def registrarAlumno(alumno)
		alumnos.push(alumno)
		"Ok"
	end

	def registrarPregunta(pregunta)
		preguntas.push(pregunta)
		"Ok"
	end

	def buscarTutor(dni)
		for alumno in alumnos
			for tutor in alumno.tutores
				if tutor.dni == dni
					return tutor
				end
			end
		end
		return nil
	end

	
end