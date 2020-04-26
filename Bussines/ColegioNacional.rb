require_relative "Alumno"
class ColegioNacional < Alumno
	attr_accessor :zona, :promedioPonderado
	def initialize(dni, apellido, nombre, edad, genero, zona, promedioPonderado)
		super(dni, apellido, nombre, edad, genero)
		@zona, @promedioPonderado = zona, promedioPonderado
	end
end