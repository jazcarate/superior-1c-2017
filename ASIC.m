pkg load control
pkg load signal

clear

function tf = cargarTF
  opcion = menu ("Forma de insercion de funcion de transferencia", "Coeficientes", "Polos/Ceros")
  switch (opcion)
    case 1
      tf = cargarCoeficientes()
    case 2
      tf = cargarPolosCeros()
  endswitch
endfunction

function retval = cargarCoeficientes
  disp("El formato es [ #CoeficienteDeMayorGrado, #CoeficienteDeproximoGrado, ..., #CoeficienteTerminoIndependiente]")
  
  numerador = input ("Coeficientes del polinomio numerador: ")
  denominador = input ("Coeficientes del polinomio denominador: ")
  
  retval = tf({numerador}, {denominador})
endfunction

function retval = cargarPolosCeros
     disp("El formato es [ #CoeficienteDeMayorGrado, #CoeficienteDeproximoGrado, ..., #CoeficienteTerminoIndependiente]")
  
  ganancia = input ("Ganancia: ")
  ceros = input ("Ceros: ")
  polos = input ("Polos: ")
    
  [num, den] = zp2tf (ceros, polos, ganancia)
    
  retval = tf({num}, {den})
endfunction

tf = cargarTF()
