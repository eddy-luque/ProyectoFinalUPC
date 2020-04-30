require_relative "Alumno"
class ColegioNacional < Alumno
	attr_accessor :zona, :promedioPonderado
	def initialize(dni, apellido, nombre, edad, genero, zona, promedioPonderado)
		super(dni, apellido, nombre, edad, genero)
		@zona, @promedioPonderado = zona, promedioPonderado
	end

	def calcularPuntajeCS
		if zona == "Rural"
		puntaje = 100
		elsif zona == "Urbana"
		puntaje = 80
		end
		return puntaje
	end

	def calcularPuntajeRE
		if promedioPonderado >= 19
			puntaje = 100
		elsif promedioPonderado >= 18 and promedioPonderado < 19
			puntaje = 80
		elsif promedioPonderado >= 16 and promedioPonderado < 18
			puntaje = 60
		elsif promedioPonderado >= 14 and promedioPonderado < 16
			puntaje = 40
		elsif promedioPonderado >=11 and promedioPonderado < 14
			puntaje = 20
		elsif promedioPonderado < 11
			puntaje = 0
		end
		return puntaje
	end
end