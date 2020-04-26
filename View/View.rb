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
    u.crearMenu("Seleccione una opción",["Registrar Alumno","Reporte","Regresar"])
  end

  def solicitarDNITutor
    u.solicitarDato("Ingresar DNI del tutor:", "'$in' no es un DNI correcto", nil,'dni')
  end

  def solicitarParentesco
    u.crearMenu("Seleccionar Parentesco",["Madre", "Padre", "Tio/Tia", "Otro"])
  end

  def solicitarMcaOtroTutor
    u.crearMenu("¿Desea registrar otro tutor?",["Si", "No"])
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

  def mostrarMensaje(o, e)
    if o == 'Ok'
      puts "El #{e} se registró correctamente"
    else
      puts "Ocurió un error: #{o}"
    end
  end

  def listarAlumnos(l)
    nl = [["Nombre","DNI","Tutor"]]
    for i in l
      nl.push([i.nombre,i.dni,i.tutores[0].nombre])
    end
    u.imprimirArreglo(nl,"Lista de Alumnos")
  end
end