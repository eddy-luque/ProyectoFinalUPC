require_relative "../Bussines/PreguntaConRespuesta"
class FactoryPreguntaConRespuesta
	def self.create(*arg)
		PreguntaConRespuesta.new(*arg)
	end
end