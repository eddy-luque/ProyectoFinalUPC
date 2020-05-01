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
	        # listarAlumnos
	        solicitarCantidadVacante # Registrar Vacantes
	      when 4
	      	reporteAlumno
	      else
	        inicio
	    end
	end

	def solicitarCantidadVacante
		# ControllerAdministrador.registrarVacante
		cAdm = ControllerAdministrador.new(v,a)
		v = cAdm.registrarVacante # Cantidad de vacantes ingresados
		a.vacantes = v
		# puts "xxxx" + a.vacantes.to_s
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

	def inicioAlumno
		dni = c.solicitarDNI
		cAdm = ControllerAdministrador.new(v, a)
	    alumno = cAdm.buscarAlumno(dni)
	    if(alumno==nil)
	    	c.mostrarMensaje("El DNI ingresado no se encuentra registrado.")
	    	inicio
	    else
		    menuAlumno(alumno,true)
	    end
	end

	def menuAlumno(alumno,first)
		opcion = nil
		if first
			opcion = c.inicioAlumno(alumno)
		else
			opcion = c.inicioAlumno
		end
		case opcion
		when 1
		      	if !alumno.calcularMcaAdmision
		        	procesarExamen(alumno, true)
		        else
	    			c.mostrarMensaje("Usted ya dió el examen.")
					menuAlumno(alumno, false)
		      	end
		    when 2
		        procesarExamen(alumno, false)
		    #when 3
		     #   verMisNotas(alumno)
		      #  c.inicioAlumno
		    when 3
		        inicio
		end
	end

	def procesarExamen(alumno, mcaAdmision)
		cAlm = ControllerAlumno.new(v, alumno, a)
		cAlm.procesarExamen(mcaAdmision)
		menuAlumno(alumno, false)
	end

	def reporteAlumno
		dni = c.solicitarDNI
		cAdm = ControllerAdministrador.new(v, a)
	    alumno = cAdm.buscarAlumno(dni)
	    if(alumno==nil)
	    	c.mostrarMensaje("El DNI ingresado no se encuentra registrado.")
	    else
	    	cAdm.reporteAlumno(alumno)
	    end
	    inicioAdm
	end
	
end