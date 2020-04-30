require_relative "Alumno"

class ColegioParticular < Alumno
	attr_accessor :monto_pension, :puesto

	def initialize(dni, apellido, nombre, edad, genero,monto_pension, puesto)
		super(dni, apellido, nombre, edad, genero)
		@monto_pension = monto_pension
		@puesto = puesto
	end

	def calcularPuntajeCS
		if monto_pension <= 200
			puntajecs = 90
		elsif monto_pension > 200 and monto_pension <= 400
			puntajecs = 70
		elsif monto_pension > 400 and monto_pension <= 600
			puntajecs = 50
		elsif monto_pension > 600
			puntajecs = 40
		end
		return puntajecs
	end			 
end