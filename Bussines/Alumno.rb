require_relative 'persona'
class Alumno < Persona
  attr_accessor :tutores
  def initialize(dni, apellido, nombre, edad, genero)
    super(dni, apellido, nombre)
    @tutores = []
  end

  def registrarTutor(tutor)
    tutores.push(tutor)
  end

  def calcularPuntajeCS()
    punto = 0
    if colegioNacional != nil
      if colegioNacional.zona.downcase == 'rural' then punto = 100
      elsif colegioNacional.zona.downcase == 'urbana' then punto = 80
      end
    elsif colegioParticular != nil
      if colegioParticular.monto_pension <= 200 then punto = 90
      elsif colegioParticular.monto_pension>200 && colegioParticular.monto_pension<=400 then punto = 70
      elsif colegioParticular.monto_pension > 400 && colegioParticular.monto_pension<=600 then punto = 50
      elsif colegioParticular.monto_pension>600 then punto 40
      end
    end
  end




  def calcularPuntajeRE()
    punto = 0
    if colegioNacional != nil
      if colegioNacional.promedio_ponderado >= 19 then punto = 100
      elsif colegioNacional.promedio_ponderado >=18 && colegioNacional.promedio_ponderado<19 then punto 80
      elsif colegioNacional.promedio_ponderado >=16 && colegioNacional.promedio_ponderado<18 then punto = 60
      elsif colegioNacional.promedio_ponderado >=14 && colegioNacional.promedio_ponderado < 16 then punto = 40
      elsif colegioNacional.promedio_ponderado >= 11 && colegioNacional.promedio_ponderado<14 then punto = 20
      else punto = 0
      end
    elsif  colegioParticular != nil
      if colegioParticular.puesto <= 3 then punto = 100
      elsif colegioParticular.puesto >= 4 && colegioParticular.puesto <= 5 then punto = 80
      elsif colegioParticular.puesto >= 6 && colegioParticular.puesto <= 10 then punto = 60
      elsif colegioParticular.puesto >= 11 && colegioParticular.puesto <= 20 then punto = 40
      else  punto = 0
      end
    end
  end





end
