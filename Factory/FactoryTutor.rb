require_relative "../Bussines/tutor"
class FactoryTutor
	def self.create(arg)
		nombre = arg[0]
		apellido = arg[1]
		parentesco = arg[2]
		dni = arg[3]
		Tutor.new(dni, apellido, nombre, parentesco)
	end
end