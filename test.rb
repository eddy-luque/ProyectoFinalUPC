
require_relative 'tutor'
require_relative 'alumno'
require_relative 'administrador'



tutor1 = Tutor.new('44332888','Lopez','Juan','Padre')
tutor2 = Tutor.new('44332777','Reategui','Lucia','Madre')

alumno1 = Alumno.new('11332211','Lopez Reategui','Rubi',31,'Mujer')
alumno1.registrarTutor(tutor1)
alumno1.registrarTutor(tutor2)


admin = Administrador.new()
admin.registrarAlumno(alumno1)


# puts admin.arrayAlumno.inspect
for p in admin.arrayAlumno
	puts "TUTORES:"
	for t in p.arrayTutor
		puts t.nombre
	end

end
