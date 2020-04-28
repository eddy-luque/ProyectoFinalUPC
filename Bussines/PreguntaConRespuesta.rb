class PreguntaConRespuesta
  attr_accessor :pregunta, :respuesta
  def initialize(pregunta, respuesta)
    @pregunta, @respuesta = pregunta, respuesta
  end
end