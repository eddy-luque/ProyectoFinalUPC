require_relative "../Bussines/Alternativa"
class FactoryAlternativa
	def self.create(arg)
		codigo = arg[0]
		alternativa = arg[1]
		Alternativa.new(codigo, alternativa)
	end
end