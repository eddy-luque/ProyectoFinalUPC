require_relative "alternativa"
class Pregunta
  attr_accessor :pregunta, :alternativas, :respuestaCorrecta, :tipoExamen
  def initialize(pregunta,tipoExamen)
    @pregunta, @alternativas, @respuestaCorrecta, @tipoExamen = pregunta, [], respuestaCorrecta, tipoExamen
  end

  def registrarAlternativa(alternativa)
  	alternativas.push(alternativa)
  end

  def calcularPuntos
  	if tipoExamen == 1
  		10
  	else
  		5
  	end
  end
end