require_relative "../Bussines/Pregunta"
class FactoryPregunta
	def self.create(arg)
		pregunta = arg[0]
		tipoExamen = arg[1]
		Pregunta.new(pregunta,tipoExamen)
	end
end