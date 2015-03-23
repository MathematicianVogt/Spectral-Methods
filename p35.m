clear all
k=15

for i =0:k
    v=(1:2^i)
    tic
    w=fft(v)
    time=toc
    semilogy(i,time,'+','markersize',15), hold on
end