class PreguntaConRespuesta
  attr_accessor :pregunta, :respuesta
  def initialize(pregunta, respuesta)
    @pregunta, @respuesta = pregunta, respuesta
  end

  def calcularPuntosRespuesta
  	if pregunta.respuestaCorrecta == respuesta
  		return pregunta.calcularPuntos
  	end
  	return 0
  end
end