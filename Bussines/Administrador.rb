class Administrador
	attr_accessor :alumnos, :preguntas, :vacantes
	def initialize()
		@alumnos = []
		@preguntas = []
		@vacantes = 0
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

	def generarExamen
		tipo = Random.new.rand(1..2)
		listaPorTipo = []
		for pregunta in preguntas
			if pregunta.tipoExamen = tipo
				listaPorTipo.push(pregunta)
			end
		end
		listaPorTipo = listaPorTipo.shuffle
		if tipo == 1
			listaPorTipo[0..9]
		elsif tipo == 2
			listaPorTipo[0..19]
		end
	end
end