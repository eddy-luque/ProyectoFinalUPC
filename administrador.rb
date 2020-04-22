class Administrador
	attr_accessor :arrayAlumno
	def initialize()
		@arrayAlumno = []
	end

	def registrarAlumno(alumno)
		arrayAlumno.push(alumno)
	end
end