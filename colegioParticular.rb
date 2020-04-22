class ColegioParticular
	attr_accessor :monto_pension, :puesto

	def initialize(monto_pension, puesto)
		@monto_pension = monto_pension
		@puesto = puesto
	end
end