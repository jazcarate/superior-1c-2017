pkg load control;
pkg load signal;

clear;

function transfer = cargarTF
  opcion = menu ("Forma de insercion de funcion de transferencia", "Coeficientes", "Polos/Ceros");
  switch (opcion)
    case 1
      transfer = cargarCoeficientes();
    case 2
      transfer = cargarPolosCeros();
  endswitch
endfunction

function retval = cargarCoeficientes
  disp("El formato es [ #CoeficienteDeMayorGrado, #CoeficienteDeproximoGrado, ..., #CoeficienteTerminoIndependiente]");
  
  numerador = input ("Coeficientes del polinomio numerador: ");
  denominador = input ("Coeficientes del polinomio denominador: ");
  
  retval = tf({numerador}, {denominador});
endfunction

function retval = cargarPolosCeros
  disp("El formato es [ #1, #2, ..., #3 ]");
  ganancia = input ("Ganancia: ");
  ceros = input ("Ceros: ");
  polos = input ("Polos: ");
    
  [num, den] = zp2tf (ceros, polos, ganancia);
    
  retval = tf({num}, {den});
endfunction

#transfer = cargarTF()
transfer = tf({[1]}, {[-4, -4]});


#1. Obtener la expresión de la función transferencia.
  transfer
#2. Indicar Polos.
 [num, den] =  tfdata (transfer, "vector");
 [ceros, polos, ganancia] =  tf2zp(num, den);
 disp("Polos:");
 disp(polos);
 
#3. Indicar Ceros.
 [num, den] =  tfdata (transfer, "vector");
 [ceros, polos, ganancia] =  tf2zp(num, den);
 disp("Ceros:");
 disp(ceros);
#4. Marcar ganancia de la función.
 [num, den] =  tfdata (transfer, "vector");
 [ceros, polos, ganancia] =  tf2zp(num, den);
 disp("Ganancia:");
 disp(ganancia);
#5. Obtener expresión con sus polos, ceros y ganancia.
 [num, den] =  tfdata (transfer, "vector");
 [Ceros, Polos, Ganancia] =  tf2zp(num, den)
#6. Mostrar gráficamente la distribución de polos y ceros.
  pzmap(transfer)
#7. Indicar estabilidad del sistema.
  estable = isstable(transfer);
  if (estable)
    disp("Es estable!");
  else
    disp("No es estable!");
  endif

#8. Obtener todas las características de la función transferencia: Esta funcionalidad barre todos los puntos anteriores (1, 2, 3, 4, 5,6 y 7).
