require_relative "../Presenter/U"
class View
  attr_accessor :u
  def initialize
    @u = U.instance
  end

  def mostrarMenuRol
    u.crearMenu("Seleccione Rol",["Alumno","Administrador"])
  end

  def mostrarMenuAdministrador
    # u.crearMenu("Seleccione una opción",["Registrar Alumno","Registrar Pregunta","Registrar Vacantes","Camiar Estado Admisión","Reporte Alumno","Reporte Pregunta","Regresar"])
    u.crearMenu("Seleccione una opción",["Registrar Alumno","Registrar Pregunta","Registrar Vacantes","Cambiar Estado Admisión","Reporte Alumno","Reporte Pregunta","Regresar"])
  end

  def mostrarMenuAlumno(*arg)
    pre = ""
    if arg.size > 0
      alumno = arg[0]
      pre = "Hola #{alumno.nombre} #{alumno.apellido}\n\n"
    end
    u.crearMenu("#{pre}Seleccione una opción",["Dar Examen","Simular Examen","Ver Mis Notas","Ver Ingreso","Regresar"])
  end

  def solicitarDNITutor
    u.solicitarDato("Ingresar DNI del tutor:", "'$in' no es un DNI correcto", nil,'dni')
  end

  def solicitarParentesco
    u.crearMenu("Seleccionar Parentesco",["Madre", "Padre", "Tio/Tia", "Otro"])
  end

  def solicitarMcaOtraAlternativa
    u.crearMenu("¿Desea registrar otra Alternativa?",["Si", "No"])
  end

  def solicitarMcaOtroTutor
    u.crearMenu("¿Desea registrar otro tutor?",["Si", "No"])
  end

  def solicitarDNI
    u.solicitarDato("Ingresar su DNI:", "'$in' no es un DNI correcto", nil,'dni')
  end

  def mostrarMenuPostExamen
    u.crearMenu("Ver Resumen:",["Si", "No"])
  end

  def solicitarDatosTutor
    nombre = u.solicitarDato("Nombre del Tutor:", nil, nil, nil,2,25)
    apellido = u.solicitarDato("Apellido del Tutor:", nil, nil,nil,2,25)
    parentesco = solicitarParentesco
    return nombre, apellido, parentesco
  end

  def solicitarDatosAlumno
    dni = u.solicitarDato("Ingresar DNI del Alumno:", "'$in' no es un DNI correcto", nil,'dni')
    nombre = u.solicitarDato("Nombre:", nil, nil, nil,2,25)
    apellido = u.solicitarDato("Apellido:", nil, nil,nil,2,25)
    edad = u.solicitarDato("Edad:", nil, nil,'i',11,15)
    genero = u.crearMenu("Genero",["Masculino","Femenino"])
    tipoColegio = u.crearMenu("Colegio",["Nacional","Particular"])
    case tipoColegio
      when 1
        zona = u.crearMenu("Zona",["Rural","Urbano"])
        promedioPonderado = u.solicitarDato("Promedio Ponderado:", nil, nil,'i',1,20)
        return tipoColegio, dni, nombre, apellido, edad, genero, zona, promedioPonderado
    end
  end

  def solicitarDatosPregunta
    pregunta = u.solicitarDato("Ingrese la Pregunta:", nil, nil, nil,2,150)
    tipoExamen = u.crearMenu("Seleccione el tipo de examen",["Examen de 10 preguntas","Examen de 20 preguntas"])
    return pregunta, tipoExamen
  end

  def solicitarDatosAlternativa(n)
    alternativa = u.solicitarDato("Ingrese la Alternativa #{n}:", nil, nil, nil,2,150)
    codigo = (n+96).chr
    return codigo, alternativa
  end

  def solicitarRespuesta(pregunta, textoPre,*arg)
    mcaAdmision = false
    if arg.size > 0
      mcaAdmision = arg[0]
    end
    alternativas = []
    for alternativa in pregunta.alternativas
      alternativas.push([alternativa.codigo, alternativa.alternativa])
    end
    if !mcaAdmision
      alternativas.push([".", "Presione punto (.) para omitir y continuar", true])
    end
    u.crearMenu("#{textoPre}#{pregunta.pregunta}",alternativas)
  end

  def mostrarMensaje(o, e)
    if o == 'Ok'
      puts "El #{e} se registró correctamente"
    else
      puts "\n#{o}"
    end
  end

  def mostrarMensajePregunta
    puts "La pregunta se registró correctamente"
  end

  def mostrarResultado(nota)
    puts "\nNota: #{nota} de 100"
  end

  def mostrarEnunciado(*arg)
    add,ptos = "",0
    if arg.size > 0
      ptos = arg[0]
    end
    if arg.size > 1
      add = arg[0]
    end
    puts "\nInicio de Examen #{add}\n---------------------\nLea e ingrese las alternativas correctas.\nCada pregunta tiene un valor de #{ptos} puntos.\nNo hay puntos en contra.\n"
  end

  def listarAlumnos(l)
    nl = [["Nombre","DNI","Tutor"]]
    for i in l
      nl.push([i.nombre,i.dni,i.tutores[0].nombre])
    end
    u.imprimirArreglo(nl,"Lista de Alumnos")
  end

  def listarPreguntas(l)
    for i in 0...l.size
      puts "#{i+1}. #{l[i].pregunta}"
      for alternativa in l[i].alternativas
          puts "   #{alternativa.codigo}. #{alternativa.alternativa}"
      end
    end
  end



  def solicitarCantidadVacante
    # return -1
    n = u.solicitarDato("Ingrese la cantidad de vacantes",nil,nil,'i',1)
    return n
  end



  def verResumenExamen(examen)
    puts "---------------------------------------------------------------------------------------------------------------"
    puts "---------------------------------------- RESUMEN EXAMEN ADMISIÓN ----------------------------------------------"
    puts "---------------------------------------------------------------------------------------------------------------"
    
    for i in 0...examen.preguntasConRespuesta.size
      preguntaConRespuesta = examen.preguntasConRespuesta[i]
      puts "#{i+1}. #{preguntaConRespuesta.pregunta}"
      for alternativa in preguntaConRespuesta.alternativas
          puts "   #{alternativa.codigo}. #{alternativa.alternativa}"
      end
      puts ""
      puts "   Alternativa Correcta: #{preguntaConRespuesta.respuestaCorrecta}"
      puts "   Alternativa Marcada : #{preguntaConRespuesta.respuesta}"
      puts "   Puntos              : #{preguntaConRespuesta.calcularPuntosRespuesta}"
      puts "----------------------------------------------------------------------------------------"
    end
    puts "---------------------------------------------------------------------------------------------------------------"
    puts "---------------------------------------------------------------------------------------------------------------"
    puts "\n\nCada pregunta tiene un valor de #{examen.preguntasConRespuesta[0].calcularPuntos} puntos.\nNo hay puntos en contra.\n"
    puts "   Fecha               : #{examen.fechaCreacion.strftime("%d/%m/%Y %I:%M%p") }"
    puts "   Respuestas Correctas: " + "#{examen.calcularPreguntasCorrectas}".rjust(4)
    puts "   Respuestas Erroneas : " + "#{examen.calcularPreguntasErroneas}".rjust(4)
    puts "   Nota                : " + "#{examen.calcularNota}".rjust(4)
    puts ""
    puts "---------------------------------------------------------------------------------------------------------------"
    puts "---------------------------------------------------------------------------------------------------------------"
  end

end