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

	def calcularPuntajeRE
		if puesto <= 3
			puntajere = 100
		elsif puesto >= 4 and puesto <= 5
			puntajere = 80
		elsif puesto >= 6 and puesto <=10
			puntajere = 60
		elsif puesto >= 11 and puesto <= 20
			puntajere = 40
		elsif puesto <= 19
			puntajere = 0
		end
		return puntajere
	end
end