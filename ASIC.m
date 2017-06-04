pkg load control;
pkg load signal;

clear;

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

function transfer = cargarTF
  disp("Ingresar una funcion de transferencia")
  opcion = menu ("Forma de insercion de funcion de transferencia", "Coeficientes", "Polos/Ceros");
  switch (opcion)
    case 1
      transfer = cargarCoeficientes();
    case 2
      transfer = cargarPolosCeros();
  endswitch
endfunction
transfer = cargarTF()

function [ceros, polos, ganancia] = obtenerPolosyCeros(transfer)
     [num, den] =  tfdata (transfer, "vector");
     [ceros, polos, ganancia] = tf2zp(num, den);
endfunction

function opcion1(transfer)
 transfer
endfunction

function opcion2(transfer)
 [ceros, polos, ganancia] =  obtenerPolosyCeros(transfer);
 disp(polos);
endfunction

function opcion3(transfer)
 [ceros, polos, ganancia] =  obtenerPolosyCeros(transfer);
 disp(ceros);
endfunction

function opcion4(transfer)
 [ceros, polos, ganancia] =  obtenerPolosyCeros(transfer);
 disp(ganancia);  
endfunction

function opcion5(transfer)
 [num, den] =  tfdata (transfer, "vector");
 [Ceros, Polos, Ganancia] =  tf2zp(num, den)  
endfunction

function opcion6(transfer)
 pzmap(transfer)
endfunction

function opcion7(transfer)
  estable = isstable(transfer);
  if (estable)
    disp("Es estable!");
  else
    disp("No es estable!");
  endif
endfunction

function opcion8(transfer)
  opcion5(transfer)
  opcion6(transfer)
  opcion7(transfer)
endfunction

function opcion9
  transfer = cargarTF()
endfunction


while(true)
  opcion = menu ("ASIC!",
    "1. Obtener la expresión de la función transferencia.",
    "2. Indicar Polos.",
    "3. Indicar Ceros.",
    "4. Marcar ganancia de la función.",
    "5. Obtener expresión con sus polos, ceros y ganancia.",
    "6. Mostrar gráficamente la distribución de polos y ceros.",
    "7. Indicar estabilidad del sistema.",
    "8. Obtener todas las características de la función transferencia",
    "9. Ingresar una nueva función.",
    "10. Finalizar.");
  switch (opcion)
    case 1
     opcion1(transfer)
    case 2
     opcion2(transfer)
    case 3
     opcion3(transfer)
    case 4
     opcion4(transfer)
    case 5
     opcion5(transfer)
    case 6
     opcion6(transfer)
    case 7
     opcion7(transfer)
    case 8
     opcion8(transfer)
    case 9
     opcion9
    case 10
     break;
  endswitch
endwhile
