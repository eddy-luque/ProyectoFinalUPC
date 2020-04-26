require_relative "../View/View"
require_relative "../Controller/Controller"
require_relative "../Controller/ControllerAdministrador"
require_relative "../Bussines/administrador"
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
	        return 2
	      when 2
	        inicioAdm
	    end
	end

	def inicioAdm
	    case c.inicioAdm
	      when 1
	        registrarAlumno
	      when 2
	        listarAlumnos
	      when 3
	        inicio
	    end
	end

	def registrarAlumno
		cAdm = ControllerAdministrador.new(v, a)
	    cAdm.registrarAlumno
	    inicioAdm
	end

	def registrarAlumnoAtomico(*arg)
		cAdm = ControllerAdministrador.new(v, a)
	    cAdm.registrarAlumnoAtomico(*arg)
	    inicioAdm
	end

	def listarAlumnos
		cAdm = ControllerAdministrador.new(v, a)
	    cAdm.listarAlumnos
	    inicioAdm
	end


end