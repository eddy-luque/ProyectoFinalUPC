require_relative "../Bussines/colegioNacional"
require_relative "../Bussines/colegioParticular"
class FactoryAlumno
	def self.create(arg)
		tipoColegio = arg[0]
		dni = arg[1]
		nombre = arg[2]
		apellido = arg[3]
		edad = arg[4]
		genero = arg[5]
		case tipoColegio
		when 1
			zona = arg[6]
			promedioPonderado = arg[7]
			ColegioNacional.new(dni, apellido, nombre, edad, genero, zona, promedioPonderado)
		when 2
			ColegioParticular.new(*arg)
		end
	end
end