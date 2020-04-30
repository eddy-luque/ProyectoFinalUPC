require_relative 'persona'
class Alumno < Persona
  attr_accessor :edad, :genero, :tutores, :examenes
  def initialize(dni, apellido, nombre, edad, genero)
    super(dni, apellido, nombre)
    @edad = edad
    @genero = genero
    @tutores = []
    @examenes = []
  end

  def registrarTutor(tutor)
    tutores.push(tutor)
  end

  def registrarExamen(examen)
    examenes.push(examen)
  end

  def calcularMcaAdmision
    for examen in examenes
      if examen.mcaAdmision
        return true
      end
    end
    return false
  end

  def calcularPuntajeCS
  end


  def calcularPuntajeRE
  end

end
