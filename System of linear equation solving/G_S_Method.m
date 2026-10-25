function G_S_Method(n)
 disp('Gauss-Seidel Method')
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
 R=zeros(n);
 At=A';
 for i=2:n
   r=At(i,:);
   for j=i:n;
     r([j])=0;
   endfor
   R(i,:)=r;
 end
 D=zeros(n);
 for i=1:n
   D(i,i)=A(i,i);
 end
 R=R';
 #disp('Lower triangular matrix');
 #disp(L);
 #disp('Upper triangular matrix');
 #disp(R);
 #disp('Main diagonal');
 #disp(D);
 B=-inv(L+D)*R;#!!
 g=inv(L+D)*F;#!!
 eig_B=eig(B);
 max_eig_B=eig_B([1]);
 for i=1:n
   if eig_B([i])>max_eig_B;
     max_eig_B=eig_B([i]);
   endif
 endfor
 tic
 x0=zeros(n,1);
 xk=B*x0+g;
 eps=norm(xk-x0);
 while eps>0.1
   x0=xk;
   xk=B*x0+g;
   eps=norm(xk-x0);
 endwhile
 disp('time for ')
 n
 toc
 xk;
endfunction
#Guss-Seidel Method is faster than Jacobi Method
