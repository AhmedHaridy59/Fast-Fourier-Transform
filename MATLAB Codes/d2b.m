function y= d2b(n,signed,bit_length,fraction_length)
    
    a = fi(n,signed,bit_length,fraction_length);
    y = a.bin;
end