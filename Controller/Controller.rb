class Controller
	attr_accessor :vista
	def initialize(*arg)
		@vista = arg[0]
	end

	def inicio
		vista.mostrarMenuRol
	end

	def inicioAdm
		vista.mostrarMenuAdministrador
	end
end