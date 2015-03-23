clear all
% p6.m - variable coefficient wave equation

% Grid, variable coefficient, and initial data:
  N = 64; h = 2*pi/N; x = h*(1:N); t = 0; dt = .1;
  [a,DM]=fourdif(N,2);
  v = cos(x) +sin(2*x); 
  c=.1;
  trans=dt*c*transpose(DM);
  iden=eye(N);
  diffo=iden-trans;
  res=inv(diffo);
% Time-stepping by leap frog formula:
  tmax = 30; tplot = .15; clf, drawnow, set(gcf,'renderer','zbuffer')
  plotgap = round(tplot/dt); dt = tplot/plotgap;
  nplots = round(tmax/tplot);
  data = [v; zeros(nplots,N)]; tdata = t;
  tic
  for i = 1:nplots
    for n = 1:plotgap
      t = t+dt;
      vnew = v*res;  v = vnew;
    end
    data(i+1,:) = v; tdata = [tdata; t];
  end
  toc
 
 for i=1:nplots
     plot(x,data(i,:))
     %axis([x(1) x(end),0 4])
     shg
     pause(.2)
 end