function Jacobi(n)
 disp('Jacobi Method')
 A=rand(n);
 A=A+eye(n)*500;
 X=ones(n,1);
 F=A*X;
 I=eye(n);
 D=zeros(n);
 for i=1:n
   D(i,i)=A(i,i);
 endfor
 tic
 B=I-inv(D)*A;
 eig_B=eig(B);
 max_eig_B=eig_B([1]);
 for i=1:n
   if eig_B([i])>max_eig_B;
     max_eig_B=eig_B([i]);
   endif
 endfor
 if max_eig_B<1
   disp('the process is converges')
   g=inv(D)*F;
   x0=zeros(n,1);
   disp('time for ');
   n
   disp('there is used inv function')
   xk=B*x0+g;
   eps=norm(xk-x0);
   while eps>0.1
     x0=xk;
     xk=B*x0+g;
     eps=norm(xk-x0);
   end
   toc
   tic
   iD=zeros(n);
   for i=1:n
     iD(i,i)=1/D(i,i);
   endfor
   B=I-iD*A;
   g=iD*F;
   x0=zeros(n,1);
   disp('time for ');
   n
   disp('there is used 1/D')
   xk=B*x0+g;
   eps=norm(xk-x0);
   while eps>0.1
     x0=xk;
     xk=B*x0+g;
     eps=norm(xk-x0);
   end
   toc
 endif
 if max_eig_B>=1
   disp('the process is disconverges')
 endif
endfunction
