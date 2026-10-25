function MN(n)
 disp('MN Method')
 A=rand(n);
 A=A+eye(n)*500;
 X=ones(n,1);
 F=A*X;
 I=eye(n);
 x0=zeros(n,1);
 tic
 r=A*x0-F;
 tau=dot(r,A*r)/dot(A*r,A*r);
 xk=x0-tau*(A*x0-F);
 eps=norm(xk-x0);
 count=1;
 while eps>0.1
   x0=xk;
   r=A*x0-F;
   tau=dot(r,A*r)/dot(A*r, A*r);
   xk=x0-tau*(A*x0-F);
   eps=norm(xk-x0);
   count=count+1;
 endwhile
 disp('time for')
 n
 toc
 count
 xk;
endfunction
#Gauss-Seidel Method is faster than MN and Jacobi Method
