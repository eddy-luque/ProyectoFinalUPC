require_relative "../View/View"
require_relative "../Controller/Controller"
require_relative "../Controller/ControllerAlumno"
require_relative "../Controller/ControllerAdministrador"
require_relative "../Bussines/Administrador"
class App
	attr_accessor :v, :c, :a
	def initialize()
		@v = View.new
		@c = Controller.new(v)
		@a = Administrador.new
	end

	def inicio	
		case c.inicio
	      when 1
	        inicioAlumno
	      when 2
	        inicioAdm
	    end
	end

	def inicioAdm
	    case c.inicioAdm
	      when 1
	        registrarAlumno
	      when 2
	        registrarPregunta
	      when 3
	        listarAlumnos
	      when 4
	        listarPreguntas
	      when 5
	        inicio
	    end
	end

	def inicioAlumno
		dni = c.solicitarDNI
		cAdm = ControllerAdministrador.new(v, a)
	    alumno = cAdm.buscarAlumno(dni)
	    if(alumno==nil)
	    	c.mostrarMensaje("El DNI ingresado no se encusntra registrado.")
	    	inicio
	    else
	    	cAlumno.modelo = alumno
		    case c.inicioAlumno
		      when 1
		        darExamen(alumno)
		      when 2
		        simularExamen(alumno)
		      when 3
		        verMisNotas(alumno)
		      when 5
		        inicio
		    end
	    end
	end

	def registrarAlumno
		cAdm = ControllerAdministrador.new(v, a)
	    cAdm.registrarAlumno
	    inicioAdm
	end

	def registrarPregunta
		cAdm = ControllerAdministrador.new(v, a)
	    cAdm.registrarPregunta
	    inicioAdm
	end

	def registrarAlumnoAtomico(*arg)
		cAdm = ControllerAdministrador.new(v, a)
		cAdm.registrarAlumnoAtomico(*arg)
	end

	def registrarPreguntaAtomico(*arg)
		cAdm = ControllerAdministrador.new(v, a)
	    cAdm.registrarPreguntaAtomico(*arg)
	end

	def listarAlumnos
		cAdm = ControllerAdministrador.new(v, a)
	    cAdm.listarAlumnos
	    inicioAdm
	end

	def listarPreguntas
		cAdm = ControllerAdministrador.new(v, a)
	    cAdm.listarPreguntas
	    inicioAdm
	end
end