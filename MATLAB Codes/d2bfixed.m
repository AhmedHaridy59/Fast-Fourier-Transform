function [ Y ] = d2bfixed( X )
   
if sign(X) == -1
    Y(1) = 1;
else
    Y(1) = 0;
end

Y(2) = abs(fix(X));

if sign(X) == -1
    fract_X = fix(X) - X;
else
    fract_X = X - fix(X);
end


a = fract_X *63;

Y(3:8)=decimalToBinaryVector(ceil(a), 6, 'MSBFirst');

end

