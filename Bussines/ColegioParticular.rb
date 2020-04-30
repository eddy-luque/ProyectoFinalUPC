require_relative "Alumno"

class ColegioParticular < Alumno
	attr_accessor :monto_pension, :puesto

	def initialize(dni, apellido, nombre, edad, genero,monto_pension, puesto)
		super(dni, apellido, nombre, edad, genero)
		@monto_pension = monto_pension
		@puesto = puesto
	end
end