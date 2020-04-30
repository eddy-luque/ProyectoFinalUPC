require_relative "Alumno"
class ColegioParticular < Alumno
	attr_accessor :monto_pension, :puesto
	def initialize(dni, apellido, nombre, edad, genero,montoPension, puesto)
		super(dni, apellido, nombre, edad, genero)
		@montoPension = montoPension
		@puesto = puesto
	end

	def calcularPuntajeCS
		if montoPension <= 200
			puntaje = 90
		elsif montoPension > 200 and montoPension <= 400
			puntaje = 70
		elsif montoPension > 400 and montoPension <= 600
			puntaje = 50
		elsif montoPension > 600
			puntaje = 40
		end
		return puntaje
	end

	def calcularPuntajeRE
		if puesto <= 3
			puntaje = 100
		elsif puesto >= 4 and puesto <= 5
			puntaje = 80
		elsif puesto >= 6 and puesto <=10
			puntaje = 60
		elsif puesto >= 11 and puesto <= 20
			puntaje = 40
		elsif puesto <= 19
			puntaje = 0
		end
		return puntaje
	end
end