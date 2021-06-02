disp('BISECCI�N')

%Variables de entrada

xi=input('Inserte Intervalo m�nimo: ');
xs=input('Inserte Intervalo m�ximo: ');
f=input('Inserte Funci�n: ','s');
tol=input('Inserte tolerancia: ');
niter=input('Inserte iteraciones: ');


fx=inline(f,'x');
fxi=fx(xi);
fxs=fx(xs);

Xi=disp(xi);
Xs=disp(xs);
F=disp(f);
T=disp(tol);
N=disp(niter);
printf('f(Xi) = %f. \n\n',fxi);
printf('f(Xs) = %f. \n\n',fxs);


disp('----------------------------------------------------------');

fprintf('\n cont         xm                e \n');



if fxi==0
  printf('Xi = %i es una ra�z',xi)
elseif fxs==0
  printf('Xs = %i es una ra�z',xs)
elseif fxi*fxs<0
  xm=(xi+xs)/2;
  fxm=fx(xm);
  cont=1;
  e=tol+1;  
end  

  while (e>tol && fxm~=0) && cont<=niter
    if fxi*fxm<0
      xs=xm;
      fxs=fxm;
    else
      xi=xm;
      fxi=fxm;
     endif
     xaux=xm;
     xm=(xi+xs)/2;
     fxm=fx(xm);
     e=abs(xm-xaux);
     fprintf('\n %g        %10.10f          %10.10f \n',cont,xm,e)
     cont=cont+1;
    end 

  if fxm==0
    printf('Xm = %i es una ra�z',xm)
  elseif e<tol
    printf('Xm = %i es una aproximaci�n con una toleracia de %e',xm,tol)
  else
    printf('Fall� en %i iteraciones',niter)
  end
  
  %disp('El intervalo es inadecuado')
end



%GRAFICO DE LA FUNCI�N

ezplot(f)

stem(cont,e)


grid on