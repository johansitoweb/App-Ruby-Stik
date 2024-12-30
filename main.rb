require 'json'

# Estructura para representar un sticker
Sticker = Struct.new(:nombre, :precio)

# Carrito de compras (inicialmente vacío)
$carrito = []

def mostrar_menu
  puts "1. Agregar sticker al carrito"
  puts "2. Ver carrito"
  puts "3. Finalizar compra"
  puts "0. Salir"
end

def agregar_sticker
  print "Ingrese el nombre del sticker: "
  nombre = gets.chomp
  print "Ingrese el precio del sticker: $"
  precio = gets.chomp.to_f
  sticker = Sticker.new(nombre, precio)
  $carrito << sticker
  puts "Sticker agregado al carrito."
end

def ver_carrito
  if $carrito.empty?
    puts "El carrito está vacío."
  else
    puts "Contenido del carrito:"
    $carrito.each_with_index do |sticker, index|
      puts "#{index + 1}. #{sticker.nombre} - $#{sticker.precio}"
    end
    total = $carrito.sum { |sticker| sticker.precio }
    puts "Total: $#{total}"
  end
end

def finalizar_compra
  puts "¡Gracias por tu compra!"
  # Aquí podrías guardar el carrito en un archivo, enviar un correo, etc.
  $carrito.clear
end

# Bucle principal
loop do
  mostrar_menu
  print "Ingrese una opción: "
  opcion = gets.chomp.to_i
  case opcion
  when 1
    agregar_sticker
  when 2
    ver_carrito
  when 3
    finalizar_compra
  when 0
    break
  else
    puts "Opción inválida."
  end
end