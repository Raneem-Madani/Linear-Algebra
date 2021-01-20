clear
clc
c_9=1;
while c_9<2
    Linear_Algebra=menu('choos:','Reduced Row Echelon Form','Solve system of equation by (Gauss-Jordan method)','Adjoint','Determinats by Expansion Method','Inverse by Expansion Method','Transpose','Solve system of equatios by (Cramer"s rule)','Inverse Matrix by (Gauss-Jordan)','Eigenvalue','Done');
    switch Linear_Algebra
        %Converting a matrix into reduce row Echelon form;
        case 1
            clc
            matrix=input('Give your matrix: ')
            rref(matrix)
        %Solve system of equation by(Gauss-Jordan) method:
        case 2
            clc
            disp('To solve these equation: Ax+By...=C and A1x+B1y...=C1,...')
            matrix=input('Put the coefficients of the first equation in the first row,and the second equation coefficients in the second row,and so on...')
            mat=rref(matrix)
            disp('The solution is: ')
            X=mat(:,end);
            disp(X)
        %Adjoint 
        case 3
            clc
            A=input('Give nxn matrix');
            n=length(A);
            A1=A;
            A2=A;
            for i=1:n
                A2(i,:)=[];
                for j=1:n
                    A1=A2;
                    A1(:,j)=[];
                    d=(-1)^(i+j);
                    s(j,i)=d*det(A1);
                end
                A2=A;
            end
            disp(A)
            adjoint=s
        %Detrminats by Expansion Method:
        case 4
            clc
            disp('Det(A)=the sum of the product of all elements in a row/column by their cofactor')
            disp('cofactor=(-1)^(i+j)|Mij|')
            disp('Mij=minor ij of matrixA')
            A=input('Give nxn matrix');
            n=length(A);
            A1=A;
            A2=A;
            for i=1:n
                A2(i,:)=[];
                for j=1:n
                    A1=A2;
                    A1(:,j)=[];
                    d=(-1)^(i+j);
                    s(j,i)=d*det(A1);
                    s1(j)=A(1,j).*s(j,1);
                end
                A2=A;
            end
            disp(A)
            determinats=sum(s1)
        %Inverse of A:
        case 5
            clc
            disp('Inverse(A)=adj(A)/det(A)')
            A=input('Give nxn matrix')
            n=length(A);
            A1=A;
            A2=A;
            for i=1:n
                A2(i,:)=[];
                for j=1:n
                    A1=A2;
                    A1(:,j)=[];
                    d=(-1)^(i+j);
                    s(j,i)=d*det(A1);
                    s1(j)=A(1,j).*s(j,1);
                end
                A2=A;
            end
            inverse=1/determinats*s
        %transpose
        case 6
            clc
            disp('transpose(A)=transpose[aij],where aij=aji.')
            Matrix=input('give nxm matrix: ');
            disp(Matrix)
            Transpose=Matrix.'
        %Solve system of equation by (Cramer's rule):
        case 7
            clc
            A=input('Give your nxm matrix "coefficients of variables": ');
            B=input('Give the solutions matrix: ');
            n=length(A);
            for i=1:n
                k=A;
                k(:,i)=B;
                x(i)=det(k)/det(A);
            end
            disp('The solution of the system is: ')
            x
        %Inverse Matrix by (Gauss-Jordan):
        case 8
            clc
            disp('[A | I]>>[I | inverse(A)]')
            A=input('Give your nxn matrix')
            n=length(A);
            A1=eye(n);
            A2=[A A1];
            A3=rref(A2);
            inverse=A3(:,n+1:2*n)
        %eidenvalue of A
        case 9
            clc
            A=input('Give your nxn matrix')
            eigenvalue=eig(A)
        %End
        case 10
            clc
            disp('Thank you')
            c_9=10;
    end
end