class Examen
  attr_accessor :mcaAdmision, :preguntasConRespuesta, :fechaCreacion
  def initialize(mcaAdmision, preguntasConRespuesta)
    @mcaAdmision, @preguntasConRespuesta, @fechaCreacion = mcaAdmision, preguntasConRespuesta, Time.now
  end

  def calcularNota
  	nota = 0
  	for resultado in preguntasConRespuesta
  		if resultado.respuesta == resultado.pregunta.respuestaCorrecta
  			nota += resultado.pregunta.calcularPuntos
  		end
  	end
  	return nota
  end

  def calcularPreguntasCorrectas
  	correctas = 0
  	for resultado in preguntasConRespuesta
  		if resultado.respuesta == resultado.pregunta.respuestaCorrecta
  			correctas += 1
  		end
  	end
  	return correctas
  end

  def calcularPreguntasErroneas
  	preguntasConRespuesta.size - calcularPreguntasCorrectas
  end
end