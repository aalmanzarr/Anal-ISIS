disp('PUNTO FIJO')

%vbles de entrada
f=input('Inserte la Funci�n f(x): ','s');
g=input('Inserte la Funci�n g(x): ','s');
xo=input('Inserte valor inicial: ');
niter=input('Inserte iteraciones: ');
t=input('Inserte tolerancia: ');


e=t+1;
cont=0;
fx=inline(f);
gx=inline(g);
fxo=fx(xo);

while fxo~=0 & e>t & cont<niter
  xn=gx(xo);
  fxo=fx(xn);
  e=abs((xn-xo)/xn);
  xo=xn;
  fprintf('\n %g        %10.10f          %10.10f \n',cont,xn,e)
  cont=cont+1;
end

if fxo==0
  fprintf('%g es una ra�z \n\n',xo)
elseif e<t
  fprintf('%g es una aproximaci�n con una tolerancia de %g\n\n',xo,t);
else
  fprintf('Fall� en %g Iteraciones \n\n',niter);
end


ezplot(f)

grid on