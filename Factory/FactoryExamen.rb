require_relative "../Bussines/Examen"
class FactoryExamen
	def self.create(*arg)
		Examen.new(*arg)
	end
end