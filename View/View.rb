require_relative "../Presenter/U"
class View
  attr_accessor :u
  def initialize
    @u = U.instance
  end
  def listar(v)
    puts imprimirArreglo([[1,2],[3,5]])
  end

  def mostrarMenuRol
    u.crearMenu("Seleccione Rol",["Alumno","Administrador"])
  end

  def mostrarMenuAdministrador
    u.crearMenu("Seleccione una opción",["Registrar Alumno","Registrar Pregunta","Reporte Alumno","Reporte Pregunta","Regresar"])
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
    edad = u.solicitarDato("Edad:", nil, nil,'i',7,120)
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

  def solicitarRespuesta(pregunta)
    alternativas = []
    for alternativa in pregunta.alternativas
      alternativas.push([alternativa.codigo, alternativa.alternativa])
    end
    u.crearMenu("Ingrese la alternativa correcta.\n#{pregunta.pregunta}",alternativas)
  end

  def mostrarMensaje(o, e)
    if o == 'Ok'
      puts "El #{e} se registró correctamente"
    else
      puts "Ocurió un error: #{o}"
    end
  end
  def mostrarMensajePregunta
    puts "La pregunta se registró correctamente"
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
end