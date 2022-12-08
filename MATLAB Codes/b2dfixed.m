function [ Y ] = b2dfixed(X1, X2, X3, X4, X5, X6, X7, X8)
   
if ((X1 == 0 && X2 == 0) || (X1 == 1 && X2 == 0))
    a = 0;
end
if ((X1 == 0 && X2 == 1)) 
        a = 1;
end
if ((X1 == 1 && X2 == 1)) 
            a = -1;
end

d = bi2de([X3, X4, X5, X6, X7, X8],'left-msb');

b = d/63;

if (X1 == 1 && X2 == 0) || ((X1 == 1 && X2 == 1)) 
    Y = a-b;
else
    Y = a+b;
end


end


