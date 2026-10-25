function Eigenvalues(n)
 disp('Eigenvalue Method')
 A=rand(n);
 A=A+eye(n)*500;
 X=ones(n,1);
 F=A*X;
 I=eye(n);
 L=zeros(n);
 for i=2:n
   l=A(i,:);
   for j=i:n;
     l([j])=0;
   endfor
   L(i,:)=l;
 end
 D=zeros(n);
 for i=1:n
   D(i,i)=A(i,i);
 end
 L;
 D;
 A=zeros(n);
 A=A+L+D+L';
 if ishermitian(A)==1
   disp('the matrix is hermitian')
 endif
 if ishermitian(A)==0
   disp('the matrix is not hermitian')
 endif
 x0=ones(n,1);
 y=A*x0;
 xk=y/norm(y);
 eps=norm(xk-x0);
 while eps>0.0001
   x0=xk;
   y=A*x0;
   xk=y/norm(y);
   eps=norm(xk-x0);
 endwhile
 eig_A=eig(A)
 disp('maximum eigenvalue to use the method')
 p=dot(xk,A*xk)/dot(xk,xk);
 disp(p)
 max_eig_A=eig_A([i]);
 for i=1:n
   if max_eig_A<=eig_A([i])
     max_eig_A=eig_A([i]);
   endif
 endfor
 disp('maximum eigenvalue to use eig function')
 disp(max_eig_A)
 x0=ones(n,1);
 x0_0=zeros(n,1);
 r=A*x0_0-x0;
 tau=dot(r,A*r)/dot(A*r,A*r);
 xk_k=x0_0-tau*(A*x0_0-x0);
 eps=norm(xk_k-x0_0);
 while eps>0.00001
   x0_0=xk_k;
   r=A*x0_0-x0;
   tau=dot(r,A*r)/dot(A*r, A*r);
   xk_k=x0_0-tau*(A*x0_0-x0);
   eps=norm(xk_k-x0_0);
 endwhile
 xk=xk_k/norm(xk_k);
 eps=norm(xk-x0);
 while eps>0.00001
   x0=xk;
   x0_0=zeros(n,1);
   r=A*x0_0-x0;
   tau=dot(r,A*r)/dot(A*r,A*r);
   xk_k=x0_0-tau*(A*x0_0-x0);
   eps_1=norm(xk_k-x0_0);
   while eps_1>0.00001
     x0_0=xk_k;
     r=A*x0_0-x0;
     tau=dot(r,A*r)/dot(A*r, A*r);
     xk_k=x0_0-tau*(A*x0_0-x0);
     eps_1=norm(xk_k-x0_0);
   endwhile
   xk=xk_k/norm(xk_k);
   eps=norm(xk-x0);
 endwhile
 disp('Minimum eigenvalue to use the method')
 p=dot(xk,A*xk)/dot(xk,xk);
 disp(p)
 min_eig_A=eig_A([i]);
 for i=1:n
   if min_eig_A>=eig_A([i])
     min_eig_A=eig_A([i]);
   endif
 endfor
 disp('minimum eigenvalue to use eig function')
 disp(min_eig_A)
endfunction

