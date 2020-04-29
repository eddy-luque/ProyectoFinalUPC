require_relative '../Factory/FactoryAlumno'
require_relative '../Factory/FactoryTutor'
require_relative '../Factory/FactoryPregunta'
require_relative '../Factory/FactoryAlternativa'
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

	def registrarPregunta
		p = vista.solicitarDatosPregunta
		f = FactoryPregunta.create(p)
		otraAlternativa = true
	    while otraAlternativa
	      	registrarAlternativa(f)
	      	if f.alternativas.size > 1
		      	if vista.solicitarMcaOtraAlternativa == 2
		      		otraAlternativa = false
		      	end
		    end
	    end
	    f.respuestaCorrecta = vista.solicitarRespuesta(f,"Ingrese la alternativa correcta.\n")
		r = modelo.registrarPregunta(f)
		vista.mostrarMensajePregunta
	end

	def registrarPreguntaAtomico(*arg)
		p = arg
		f = FactoryPregunta.create(p)
	    f.respuestaCorrecta = arg[3]
		for t in arg[2]
			dt = FactoryAlternativa.create(t)
			f.registrarAlternativa(dt)
		end
		modelo.registrarPregunta(f)
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

	def registrarAlternativa(pregunta)
		p = vista.solicitarDatosAlternativa(pregunta.alternativas.size+1)
		f = FactoryAlternativa.create(p)
		pregunta.registrarAlternativa(f)
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

	def buscarAlumno(dni)
		for alumno in modelo.alumnos
			if alumno.dni == dni
				return alumno
			end
		end
		return nil
	end

	def listarPreguntas
		l = modelo.preguntas
		vista.listarPreguntas(l)
	end

	def registrarVacante
		c = vista.solicitarCantidadVacante # Cantidad de vacante ingresado
		puts c.to_s
	end
end