class Persona
  attr_accessor :dni, :apellido, :nombre
  def initialize(dni, apellido, nombre)
    @dni = dni
    @apellido = apellido
    @nombre = nombre
  end
end
