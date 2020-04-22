require_relative 'persona'

class Tutor < Persona
  attr_accessor :parentesco
  def initialize(dni, apellido, nombre, parentesco)
    super(dni, apellido, nombre)
    @parentesco = parentesco
  end
end
