require_relative 'Pregunta'
class PreguntaConRespuesta < Pregunta
  attr_accessor :respuesta
  def initialize(pregunta, tipoExamen)
  	super(pregunta, tipoExamen)
    @respuesta = nil
  end

  def calcularPuntosRespuesta
  	if respuestaCorrecta == respuesta
  		return calcularPuntos
  	end
  	return 0
  end
end