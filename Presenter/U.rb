require 'singleton'
class U
	include Singleton
  def imprimirArreglo(a,titulo)
    tamanios = Array.new(a[0].size,0)
    for i in 0...a.size
      for j in 0...a[i].size
        if a[i][j].instance_of?Array 
          dato = a[i][j][0].to_s
          if a[i][j][1] == 1
            dato = "%.2f" % a[i][j][0]
          end
          if dato.to_s.size > tamanios[j]
            tamanios[j] = dato.to_s.size
          end
        elsif a[i][j].to_s.size > tamanios[j]
          tamanios[j] = a[i][j].to_s.size
        end
      end
    end
    retorno=''
    linea=''
    for i in 0...a.size
      retorno += '|  '
      for j in 0...a[i].size
        if a[i][j].instance_of?Array
          case a[i][j][1]
          when 1
            retorno += ("%.2f" % a[i][j][0]).to_s.rjust(tamanios[j]) + '  |  '
          when 2
            retorno += '  ' + a[i][j][0].to_s.rjust(tamanios[j]) + '  |  '
          end
        elsif a[i][j].instance_of?String
          retorno += a[i][j].ljust(tamanios[j] + 2) + '|  '
        else
          retorno += a[i][j].to_s.rjust(tamanios[j]) + '  |  '
        end
        if i == 0
          linea += " ".ljust(tamanios[j] + 5, '-')
        end
      end
      if i == 0
        retorno = linea + "\n" + retorno + "\n"  + linea
      end
      retorno+="\n"
    end
    retorno += linea + "\n\n\n"
    linea = " ".ljust(linea.size, '-')
    puts linea + "\n|  " + titulo.ljust(linea.size-3) + "|\n" + retorno
  end

  def solicitarDato(*arg)
      textoSolicitud, textoError, posiblesValores, tipoDeDato, min, max = arg[0]
      if arg.size > 1
        textoError = arg[1]
      end
      if arg.size > 2
        posiblesValores = arg[2]
      end
      if arg.size > 3
        tipoDeDato = arg[3]
      end
      if arg.size > 4
        min = arg[4]
      end
      if arg.size > 5
        max = arg[5]
      end

      puts "\n#{textoSolicitud}"
      v = gets.chomp
      r = nil
      case tipoDeDato
      when 'i'
        r = v.to_i
        if r.to_s != v
          puts "\n#{textoError}\n".gsub('$in', v)
          return solicitarDato(*arg)
        elsif min != nil && r < min
          puts "\nEl valor mínimo es #{min}\n"
          return solicitarDato(*arg)
        elsif max != nil && r > max
          puts "\nEl valor máximo es #{max}\n"
          return solicitarDato(*arg)
        end
      when 'dni'
        x = v.to_i
        if x <= 0 || v.size != 8
          puts "\n#{textoError}\n".gsub('$in', v)
          return solicitarDato(*arg)
        end
        r = v
      when nil
        if min != nil && v.size < min
          puts "\nEl tamaño mínimo es #{min}\n"
          return solicitarDato(*arg)
        elsif max != nil && v.size > max
          puts "\nEl tamaño máximo es #{max}\n"
          return solicitarDato(*arg)
        end
        r = v
      end

      if posiblesValores != nil && posiblesValores.index(r)==nil
        puts "\n#{textoError}\n".gsub('$in', v)
        return solicitarDato(*arg)
      end
      return r
  end

  def crearMenu(titulo,items)
    textoSolicitud, posiblesValores, tipoDeDato = "#{titulo}",[]
    for i in 0...items.size
      if items[i].instance_of?Array
        textoSolicitud += "\n   #{items[i][0]}. #{items[i][1]}"
        posiblesValores.push(items[i][0])
      else
        textoSolicitud += "\n   #{i+1}. #{items[i]}"
        posiblesValores.push(i+1)
        tipoDeDato = 'i'
      end
    end
    solicitarDato(textoSolicitud, "\n'$in' no es una opción válida, intentelo otra vez!!\n", posiblesValores, tipoDeDato)
  end
 end