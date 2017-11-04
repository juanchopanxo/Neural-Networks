%Limpiamos la pantalla y borramos todas las variables creadas anteriormente
clc;
clear;

%Recibimos el nombre del archivo como un String (por eso la 's')
archivo = input ('Introduce el nombre del archivo que contiene a W: ', 's');

%Abrimos el archivo que contiene la matriz a usar en modo lectura
archivo_matriz = fopen (archivo, 'r');

%Recibimos el n�mero de filas y columnas que tiene la matriz para lectura
num_filas = input ('Ingresa el n�mero de patrones prototipo (filas) que tiene la matriz: ');
num_col = input ('Ingresa el n�mero de rasgos de cada patron (columas) que tiene la matriz: ');

%Creamos una matriz para el bias
bias = zeros (num_filas,1);
bias = bias + num_col;

while ~feof (archivo_matriz)
    [W, cont] = fscanf (archivo_matriz, '%f', [num_col num_filas]);
end
W = W';

clc
%Recibimos el nombre del archivo como un String (por eso la 's')
archivo = input ('Introduce el nombre del archivo que contiene el vector de entrada: ', 's');

%Abrimos el archivo que contiene la matriz a usar en modo lectura
archivo_matriz = fopen (archivo, 'r');

%Guardamos el vector de entrada p en una matriz
p = fscanf (archivo_matriz, '%f');

%COMIENZA LA CAPA FEEDFORWARD (1 vez)
a = purelin((W * p) + bias)





%ESCRIBIR LA MATRIZ EN UN ARCHIVO DE TEXTO LLAMADO NEW

%Calculamos el tama�o de la matriz W
[f, c] = size (W);
nuevo = fopen ('new.txt', 'w');

%Escribimos los datos en un archivo
for i = 1:f
    for j = 1:c
        fprintf (nuevo,'%f\t', W(i, j));
    end
      fprintf(nuevo, '\n');
end







%Cerramos los archivos
fclose (archivo_matriz);
fclose (nuevo);

%Borramos todas las variables creadas durante la ejecuci�n del programa
clear;