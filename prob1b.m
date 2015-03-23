% p1.m - convergence of fourth-order finite differences
clear all
% For various N, set up grid in [-pi,pi] and function u(x):
  Nvec = 2.^(3:20);
  clf, subplot('position',[.1 .4 .8 .5])
  for N = Nvec
    
    h = 2*pi/N; x = -pi + (1:N)'*h;
    x1=x(1:(N/2)-1);
    x2=x((N/2):N);
    u(1:(N/2)-1,1) = exp(-sin(x1).*sin(x1)); uprime(1:(N/2)-1,1) = -2*sin(x1).*cos(x1).*u(1:(N/2)-1);
    u((N/2):N,1) = exp(sin(x2).*sin(x2)); uprime((N/2):N,1) = 2*sin(x2).*cos(x2).* u((N/2):N);
    %keyboard
    % Construct sparse fourth-order differentiation matrix:
    tic 
    e = ones(N,1);
    D =   sparse(1:N,[2:N 1],2*e/3,N,N)...
        - sparse(1:N,[3:N 1 2],e/12,N,N);
    D = (D-D')/h;
    time=toc
    % Plot max(abs(D*u-uprime)):
    error = norm(D*u-uprime,inf);
    loglog(N,error,'.','markersize',15), hold on
    loglog(N,time,'+','markersize',15), hold on
  end
  grid on, xlabel N, ylabel error
  title('Convergence of fourth-order finite differences')
  semilogy(Nvec,Nvec.^(-4),'--') 
  text(105,5e-8,'N^{-4}','fontsize',18)