require_relative '../Factory/FactoryAlumno'
require_relative '../Factory/FactoryTutor'
class ControllerAdministrador
	attr_accessor :vista, :modelo
	def initialize(vista, modelo)
		@vista, @modelo = vista, modelo
	end

	def registrarAlumno
		p = vista.solicitarDatosAlumno
		f = FactoryAlumno.create(p)
		conTutor = false
	    while !conTutor
	      dniTutor = vista.solicitarDNITutor
	      if f.tutores.size == 1 && dniTutor == f.tutores[0].dni
	      	vista.mostrarMensaje("El tutor ya se encuentra registrado",nil)
	      	if vista.solicitarMcaOtroTutor == 2
	      		conTutor = true
	      	end
	      else
	      	t = modelo.buscarTutor(dniTutor)
		    if t == nil
		    	registrarTutor(f,dniTutor)
		    else
		      	parentesco = vista.solicitarParentesco
		      	clonarTutor(t, parentesco, f)
		    end
		    if f.tutores.size ==1
		      	if vista.solicitarMcaOtroTutor == 2
		      		conTutor = true
		    	end
		    else
		      	conTutor = true
		    end
	      end
	    end
		r = modelo.registrarAlumno(f)
		vista.mostrarMensaje(r,"Alumno")
	end

	def registrarAlumnoAtomico(*arg)
		p = arg
		f = FactoryAlumno.create(p)
		for t in arg[8]
			dt = FactoryTutor.create(t)
			f.registrarTutor(dt)
		end
		modelo.registrarAlumno(f)
	end

	def registrarTutor(alumno,dni)
		p = vista.solicitarDatosTutor
		p.push(dni)
		f = FactoryTutor.create(p)
		alumno.registrarTutor(f)
	end

	def clonarTutor(t,p,alumno)
		dt = [t.nombre, t.apellido, p, t.dni]
		f = FactoryTutor.create(dt)
		alumno.registrarTutor(f)
	end

	def listarAlumnos
		l = modelo.alumnos
		vista.listarAlumnos(l)
	end
end