require_relative 'persona'

class Alumno < Persona
  attr_accessor :edad, :genero
  def initialize(dni, apellido, nombre, edad, genero)
    super(dni, apellido, nombre)
    @edad = edad
    @genero = genero
  end
end
