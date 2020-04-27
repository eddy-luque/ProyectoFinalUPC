class ControllerAlumno
	attr_accessor :vista, :modelo, :modeloAdm
	def initialize(vista, modelo, modeloAdm)
		@vista, @modelo, @modeloAdm = vista, modelo, modeloAdm
	end
end