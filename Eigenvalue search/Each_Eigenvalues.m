function Each_Eingenvalues(n)
 disp('Each_Eigenvalues Method')
 A=rand(n);
 A=A+eye(n)*5;
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
 A=A+L+D+L'
 if ishermitian(A)==1
   disp('the matrix is hermitian')
 endif
 if ishermitian(A)==0
   disp('the matrix is not hermitian')
 endif
 tic
 H=hess(A);
 [Q,R]=qr(H);
 A0=H;
 Ak=R*Q;
 a1=zeros(n,1);
 for i=2:n
   a1(i,i-1)=Ak(i,i-1);
 endfor
 a2=zeros(n,1);
 for i=1:n
   a2(i,i)=Ak(i,i)-A0(i,i);
 endfor
 eps_1=norm(a1);
 eps_2=norm(a2);
 while (eps_1>0.01 || eps_2>0.01)
   A0=Ak;
   [Q,R]=qr(Ak);
   Ak=R*Q;
   a1=zeros(n,1);
   for i=2:n
     a1(i,i-1)=Ak(i,i-1);
   endfor
   a2=zeros(n,1);
   for i=1:n
     a2(i,i)=Ak(i,i)-A0(i,i);
   endfor
   eps_1=norm(a1);
   eps_2=norm(a2);
 endwhile
 eig_Ak=zeros(n,1);
 for i=1:n
   eig_Ak([i])=Ak(n+1-i,n+1-i);
 endfor
 disp('time for');
 n
 toc
 disp('all eigenvalues to get to use QR method')
 disp(eig_Ak)
 disp('all eigenvalues to get to use eig function')
 eig_A=eig(A);
 disp(eig_A)
endfunction
