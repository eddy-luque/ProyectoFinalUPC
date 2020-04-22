class AlumnoColegioNacional
	attr_accessor :zona, :promedio_ponderado
	def initialize(zona,promedio_ponderado)
		@zona = zona
		@promedio_ponderado = promedio_ponderado
	end
end