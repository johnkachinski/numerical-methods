function Relaxition_Method(n)
 disp('Relaxition Method')
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
 B=I-inv(D)*A;
 eig_B=eig(B);
 max_eig_B=eig_B([1]);
 for i=1:n
   if eig_B([i])>max_eig_B;
     max_eig_B=eig_B([i]);
   endif
 endfor
 omega=1;
 Bjr=((1-omega)*I+omega*B);
 g=omega*inv(D)*F;
 tic
 x0=zeros(n,1);
 xk=Bjr*x0+g;
 eps=norm(xk-x0);
 while eps>0.1
   x0=xk;
   xk=Bjr*x0+g;
   eps=norm(xk-x0);
 endwhile
 disp('time for');
 n
 omega;
 toc
 xk;
endfunction
#Relaxition Method is faster than Jacobi Method
