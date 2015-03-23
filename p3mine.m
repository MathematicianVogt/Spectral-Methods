clear all
  h = (1/64); xmax = 10; clf
  x = -xmax:h:xmax;                   
  xx = -xmax-h/20:h/10:xmax+h/20;
  
  v1= @(x) (x==0);
  v2= @(x) (abs(x)<=3);
  v3= @(x)  max(0,1-abs(x)/3);
  
  p1 = zeros(size(xx));
  p2 = zeros(size(xx));
  p3 = zeros(size(xx));
    for i = 1:length(x),
      p1 = p1 + v1(i)*sin(pi*(xx-x(i))/h)./(pi*(xx-x(i))/h);
      p2 = p2 + v2(i)*sin(pi*(xx-x(i))/h)./(pi*(xx-x(i))/h);
      p3 = p3 + v3(i)*sin(pi*(xx-x(i))/h)./(pi*(xx-x(i))/h);
      
    end
 error1=abs(v1(xx)-p1);
 error2=abs(v2(xx)-p2);
 error3=abs(v3(xx)-p3);
 subplot(2,2,1, 'XScale', 'log', 'YScale', 'log');
 semilogy(xx,error1,'.','markersize',14), grid on
 title('delta');
 
 subplot(2,2,2, 'XScale', 'log', 'YScale', 'log');
 semilogy(xx,error2,'.','markersize',14), grid on;
 title('square');
 
 subplot(2,2,3, 'XScale', 'log', 'YScale', 'log')
 semilogy(xx,error3,'.','markersize',14), grid on
 title('hat')
 
 
 
 