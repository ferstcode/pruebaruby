def read_alum(file_name)
  file = File.open(file_name, 'r')
  alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alum
end

arreglo_de_notas = read_alum('info_alumnos.csv')

def menu
  puts 'Opcion 1 para ver el nombre de cada alumno y el promedio de sus notas'
  puts 'Opcion 2 para vel el nombre de cada alumno y la cantidad de inasistencias'
  puts 'Opcion 3 para ver el nombre de los alumnos aprobados'
  puts 'Opcion 4 para salir'
end
def promedios(arreglo_de_notas, min_aprobacion)
  arreglo_de_notas.each do |datos|
    nombre =datos[0]
    notas = (datos.map do |num| num.to_i end).sum
      cantidad_notas = datos[1..-1].count.to_f
      promedio = notas/ cantidad_notas
      if min_aprobacion != '0'
        if promedio >= min_aprobacion
          puts "\n#{nombre} aprobó con promedio #{promedio}"
        end
      else
        if promedio >= 5
          puts "\n#{nombre} aprobó con promedio #{promedio}"
        else
        end
      end
    end
  end

menu
puts 'Ingrese una opcion'
opcion = gets.chomp.to_i

while opcion !=4
  if opcion == 1
    arreglo_de_notas.each do |info|
      nombre = info[0]
      notas = (info.map do |num| num.to_i end).sum
        cantidad_notas = info[1..-1].count.to_f
        promedio = notas/ cantidad_notas
        puts "\nEl promedio de notas de #{nombre} es #{promedio}"
      end
      #Imprimir en pantalla el nombre de cada alumno y el promedio de sus notas
    elsif opcion == 2
      arreglo_de_notas.each do |info|
        nombre = info[0]
        inasistencias = 0
        inasistencias += 1 if info.include? 'A'
        puts "\n#{nombre} tiene: #{inasistencias} inasistencias"
      end
      #Imprimir en pantalla el nombre de cada alumno y la cantidad de inasistencias
    elsif opcion ==3
      puts 'Ingrese el mínimo de aprobacion'
      min_aprobacion = gets.chomp.to_i
        promedios(arreglo_de_notas,min_aprobacion)
        #Imprimir en pantalla los nombres de los alumnos aprobados
      elsif opcion ==4
        puts 'Adios!!'
        #Termina el programa
      else
        puts 'Ingrese una opcion valida'

      end
      puts'------------------------------------------'
      menu
      puts 'Ingrese una opcion'
      opcion = gets.chomp.to_i


    end
