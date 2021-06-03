% ELIMINACION GAUSSIANA CON PIVOTEO PARCIAL 

format long %permite utilizar la maxima capacidad de la maquina

fprintf('ELIMINACION GAUSSIANA CON PIVOTEO PARCIAL (SOLUCION POR ETAPAS)\n\n\n');

A=input('Ingrese la matriz A = \n');
b=input('\nIngrese el vector b, correspondite a los terminos independientes b=\n');
% Las matrices A y b deben ser ingresadas entre corchetes separando las
%columnas mediante coma ',' y las filas mediante punto y coma ';'.

%permite obtener el tamaño de la matriz A
[n,m]=size(A);
% la matriz C, representa la forma de la matriz aumentada [Ab]
C=[A,b];


fprintf('\nLa Matriz C, que corresponte a la matriz aumentada [Ab] es = \n');
disp(C);  % la funcion disp nos permite imprimir una variable en el espacio de trabajo

if n==m %compara el numero de columnas y filas, para observar si son iguales
    for k=1:(n-1)
        fprintf('\n ETAPA %g=\n\n',k)
        mayor=0; %asigna como cero el numero mayor de la fila
        filam=k; %asigna la fila k como la columna que tiene el numero mayor
        for p=k:n
            if mayor<abs(C(p,k)) %se busca el numero mayor en la fila K;
                mayor=abs(C(p,k));%cambio de mayor
                filam=p; %cambio de fila
            end
        end
        if mayor ==0
            fprintf('\nEl sistema tiene infinitas soluciones\n')
            break %se interrumpe el programa con la instruccion break, ya que 
                  %si mayor=o, mas adelante se obtiene una division por
                  %cero
        else
            if filam ~= k 
            for j=1:(n+1)
                aux=C(k,j); %para poder intercambiar las filas, utilizamos una
                            %variable auxiliar
                C(k,j)=C(filam,j);
                C(filam,j)=aux;
            end
            end
        end
        fprintf('\nLa matriz correspondiente a esta etapa antes del proceso:\n')
         
         disp(C)
         fprintf('\nLos Multiplicadores correpondientes a esta etapa son:\n')
         for i=(k+1):n
            m(i,k)=C(i,k)/C(k,k); %formula multiplicadores
            fprintf('\nm(%g,%g)=',i,k)
            disp(m(i,k));
            for j=k:(n+1)
                C(i,j)= C(i,j) - m(i,k)*C(k,j);%formula nueva fila
            end
         end
         fprintf('\nLa matriz correspondiente a esta etapa despues del proceso:\n')
         
         disp(C)
    end
         for i=n:-1:1
            suma=0;
               for p=(i+1):n
                suma = suma + C(i,p)*X(p);
               end
            X(i)=(C(i,n+1)-suma)/C(i,i);
            %formula de la susticion regresiva y solucion de las variables
         end
else %funcion asignada del if, en caso de que este sea falso
     fprintf('\nERROR: La matriz NO es cuadrada\n');
end
fprintf('\n\n SOLUCION:\n');
fprintf('\n\nLa matriz Ab final:\n');
disp(C)
fprintf('\n\nLa solucion de X1 hasta Xn es:\n');

%Se muestran los resultados de todo el proceso
for i=1:n
    Xi=X(1,i);
    fprintf('\nX%g=',i)
    disp(Xi);
end

       
            
        
               