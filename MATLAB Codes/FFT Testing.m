clc
clear

Case_statement = fopen('D:\Projects Workshop\FFT Project\Case_statement.txt','w');


for k=0:1:15

    w(k+1)=exp(-2i*pi*k/32);
    x1(k+1)=real(w(k+1));
    y1(k+1)=imag (w(k+1));
    outReal1(k+1,1:8)=d2bfixed(x1(k+1));
    outimag1(k+1,1:8)=d2bfixed(y1(k+1));
end
x= [0.0144554446921702+-0.126667057577435i,0.125529238775267+0.0398272125333887i,0.0282450719152376+-0.0191427169608853i,0.0478683381794981+-0.217864517861427i,0.155870074342769+-0.113421445718476i,0.0113436976691546+0.177033104215971i,-0.0567153663017529+0.198514045430436i,0.107085316444779+0.0131092725412999i,0.0321626366247342+-0.0538364600886991i,-0.160227538288252+-0.00344635525155024i,0.0298709699850078+-0.0606668570977911i,0.24829993273984+-0.0982133815508827i,0.131747223329237+0.00819368969933322i,-0.0569800992145486+0.0239011754332718i,0.021100693452717+0.123019568644529i,0.181632236098831+0.241453047306905i,-0.09190960324528+0.0746960880388322i,-0.223389686521824+-0.0409710478826261i,0.136218075434178+-0.0625474301611268i,0.0596431215230114+-0.131513530915529i,-0.240909201300852+-0.0688317418814192i,-0.0423613300852153+0.0937527460669i,0.139309882254499+0.164322034216517i,0.0621546390933533+0.0643163042793088i,0.121108292844666+-0.0129757224727744i,0.0894122888832962+0.0498223681268802i,-0.123143346490435+0.0709999793210744i,-0.0440011612672646+-0.0213394134053265i,0.00344256250102151+-0.0585115052106735i,-0.227192645246924+0.000250140263676365i,-0.143094486345128+-0.0301067877637916i,0.105182460651632+-0.00955148675445991i];
N = 7;
f = 6;


for i =1:32

    xx= real(x(i));
    xy= imag (x(i));
    

    xx_bin(i,1:8)= d2bfixed(xx);
   
    xy_bin(i,1:8)= d2bfixed(xy);
   
   x_bin(i,1:16) = [xx_bin(i,1:8) , xy_bin(i,1:8)];
end



X_concat = [x_bin(31+1,:), x_bin(15+1,:), x_bin(23+1,:), x_bin(7+1,:), x_bin(27+1,:), x_bin(11+1,:), x_bin(19+1,:),x_bin(3+1,:),x_bin(29+1,:), x_bin(13+1,:), x_bin(21+1,:), x_bin(5+1,:), x_bin(25+1,:), x_bin(9+1,:), x_bin(17+1,:),x_bin(1+1,:),x_bin(30+1,:), x_bin(14+1,:), x_bin(22+1,:), x_bin(6+1,:), x_bin(26+1,:), x_bin(10+1,:), x_bin(18+1,:),x_bin(2+1,:),x_bin(28+1,:), x_bin(12+1,:), x_bin(20+1,:), x_bin(4+1,:), x_bin(24+1,:), x_bin(8+1,:), x_bin(16+1,:),x_bin(0+1,:)];


X_concat = transpose(X_concat);


formatSpec = '512''b%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c_%c%c%c%c%c%c%c%c ; \n';
fprintf(Case_statement,formatSpec,X_concat+48);

% Testing for A
A =[];

A(0+1) = x(0+1) + x(16+1);
A(1+1) = x(0+1) - x(16+1);

A(2+1) = x(8+1) + x(24+1);
A(3+1) = x(8+1) - x(24+1);

A(4+1) = x(4+1) + x(20+1);
A(5+1) = x(4+1) - x(20+1);

A(6+1) = x(12+1) + x(28+1);
A(7+1) = x(12+1) - x(28+1);

A(8+1) = x(2+1) + x(18+1);
A(9+1) = x(2+1) - x(18+1);

A(10+1) = x(10+1) + x(26+1);
A(11+1) = x(10+1) - x(26+1);

A(12+1) = x(6+1) + x(22+1);
A(13+1) = x(6+1) - x(22+1);

A(14+1) = x(14+1) + x(30+1);
A(15+1) = x(14+1) - x(30+1);

A(16+1) = x(1+1) + x(17+1);
A(17+1) = x(1+1) - x(17+1);

A(18+1) = x(9+1) + x(25+1);
A(19+1) = x(9+1) - x(25+1);

A(20+1) = x(5+1) + x(21+1);
A(21+1) = x(5+1) - x(21+1);

A(22+1) = x(13+1) + x(29+1);
A(23+1) = x(13+1) - x(29+1);

A(24+1) = x(3+1) + x(19+1);
A(25+1) = x(3+1) - x(19+1);

A(26+1) = x(11+1) + x(27+1);
A(27+1) = x(11+1) - x(27+1);

A(28+1) = x(7+1) + x(23+1);
A(29+1) = x(7+1) - x(23+1);

A(30+1) = x(15+1) + x(31+1);
A(31+1) = x(15+1) - x(31+1);
for i =1:32
    Ax= real(A(i));
    Ay= imag (A(i));
    

    Ax_bin(i,1:8)= d2bfixed(Ax);
   
    Ay_bin(i,1:8)= d2bfixed(Ay);
   
   A_bin(i,1:16) = [Ax_bin(i,1:8) , Ay_bin(i,1:8)];
end

A_concat = [A_bin(31+1,:), A_bin(29+1,:), A_bin(30+1,:), A_bin(28+1,:), A_bin(27+1,:), A_bin(25+1,:),A_bin(26+1,:),A_bin(24+1,:),A_bin(23+1,:),A_bin(21+1,:),A_bin(22+1,:),A_bin(20+1,:), A_bin(19+1,:),A_bin(17+1,:), A_bin(18+1,:),A_bin(16+1,:),A_bin(15+1,:), A_bin(13+1,:), A_bin(14+1,:),A_bin(12+1,:), A_bin(11+1,:),A_bin(9+1,:), A_bin(10+1,:),A_bin(8+1,:),A_bin(7+1,:),A_bin(5+1,:), A_bin(6+1,:), A_bin(4+1,:), A_bin(3+1,:), A_bin(1+1,:), A_bin(2+1,:),A_bin(0+1,:)];

A_tested = [0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 1 0 0 0 0  0 0 1 1 1 0 0 0 0 1 0 0 0 0 0 1 0 0 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 0 1 1 0 0 0 0 0 1 1 0 0 0 0 1 0 0 1 1 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 1 0 0 0 0 1 1 0 1 1 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 1 0 0 1 0 1 1 1 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 0 1 0 0 1 0 0 1 1 0 0 0 0 0 0 1 1 1 0 0 0 0 0 1 0 0 0 0 1 0 0 1 0 1 0 0 1 0 0 0 1 1 0 0 0 0 1 0 1 0 0 0 1 0 1 1 1 0 0 0 0 0 1 1 0 1 0 0 0 0 1 0 1 0 0 0 0 0 0 1 1 1 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0 1 0 1 0 0 0 1 1 0 1 0 0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0 1 0 0 0 1 1 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 1 0 0 1 1 0 0 0 0 1 1 1 0 0 0 0 0 0 1 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 1 1 1 0 0 0 0 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 1 0 1 0 1 0 0 0 0 0 1 1 0 0 0 0 1 0 1 0 1 0 0 0 0 0 1 1 1 0 0 0 0 1 1 0 1 0 0 0 1 1 0 1 1 0 0 0 0 1 0 1 1 0 0 0 0 0 1 1 0 0 0 0 0 1 1 1 1 0 0 0 1 1 0 1 0 0 0 0 1 0 1 1 1 0 0 0 0 1 0 1 1 0 0 0 0 1 0 1 1 0 0 0 0 0 1 1 ];

iA_error =[]; % refer t the index of the error
error = []; % refer is there's error '1' or not '0' 
for i = 1:512
    if A_concat(1,i) ~=  A_tested(1,i)
        error = [error 1];
        iA_error = [iA_error i];
    else
        error = [error 0];
    end
end

%% Testing for B
B =[];

B(0+1) = A(0+1) + A(2+1);
B(1+1) = A(0+1) - A(2+1);

B(2+1) = A(1+1) + w(1+8)* A(3+1);
B(3+1) = A(1+1) - w(1+8)* A(3+1);

B(4+1) = A(4+1) + A(6+1);
B(5+1) = A(4+1) - A(6+1);

B(6+1) = A(5+1) + w(1+8)* A(7+1);
B(7+1) = A(5+1) - w(1+8)* A(7+1);

B(8+1) = A(8+1) + A(10+1);
B(9+1) = A(8+1) - A(10+1);

B(10+1) = A(9+1) + w(1+8)* A(11+1);
B(11+1) = A(9+1) - w(1+8)* A(11+1);

B(12+1) = A(12+1) + A(14+1);
B(13+1) = A(12+1) - A(14+1);

B(14+1) = A(13+1) + w(1+8)* A(15+1);
B(15+1) = A(13+1) - w(1+8)* A(15+1);

B(16+1) = A(16+1) + A(18+1);
B(17+1) = A(16+1) - A(18+1);

B(18+1) = A(17+1) + w(1+8)* A(19+1);
B(19+1) = A(17+1) - w(1+8)* A(19+1);

B(20+1) = A(20+1) + A(22+1);
B(21+1) = A(20+1) - A(22+1);

B(22+1) = A(21+1) + w(1+8)* A(23+1);
B(23+1) = A(21+1) - w(1+8)* A(23+1);

B(24+1) = A(24+1) + A(26+1);
B(25+1) = A(24+1) - A(26+1);

B(26+1) = A(25+1) + w(1+8)* A(27+1);
B(27+1) = A(25+1) - w(1+8)* A(27+1);

B(28+1) = A(28+1) + A(30+1);
B(29+1) = A(28+1) - A(30+1);

B(30+1) = A(29+1) + w(1+8)* A(31+1);
B(31+1) = A(29+1) - w(1+8)* A(31+1);

for i =1:32
    
    Bx= real(B(i));
    By= imag (B(i));
    

    Bx_bin(i,1:8)= d2bfixed(Bx);
   
    By_bin(i,1:8)= d2bfixed(By);
   
   B_bin(i,1:16) = [Bx_bin(i,1:8) , By_bin(i,1:8)];
end

B_concat = [B_bin(31+1,:), B_bin(27+1,:), B_bin(29+1,:), B_bin(25+1,:), B_bin(30+1,:), B_bin(26+1,:),B_bin(28+1,:),B_bin(24+1,:),B_bin(23+1,:),B_bin(19+1,:),B_bin(21+1,:),B_bin(17+1,:), B_bin(22+1,:),B_bin(18+1,:), B_bin(20+1,:),B_bin(16+1,:),B_bin(15+1,:), B_bin(11+1,:), B_bin(13+1,:),B_bin(9+1,:), B_bin(14+1,:),B_bin(10+1,:), B_bin(12+1,:),B_bin(8+1,:),B_bin(7+1,:),B_bin(3+1,:),B_bin(5+1,:), B_bin(1+1,:), B_bin(6+1,:), B_bin(2+1,:),B_bin(4+1,:),B_bin(0+1,:)];

B_tested = [1 0 0 0 1 1 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 1 1 1 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 1 1 0 0 0 0 1 0 1 1 0 0 0 1 1 1 0 0 0 0 1 0 1 0 0 1 0 0 0 1 0 0 1 1 0 0 0 0 1 0 1 1 0 0 1 1 0 0 0 0 0 0 1 1 1 1 0 0 0 0 1 0 1 0 1 0 0 0 1 0 1 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 0 0 1 0 0 0 1 1 1 0 0 1 0 0 0 1 0 1 1 0 0 0 1 0 0 0 1 0 0 0 0 1 1 1 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0 1 0 1 1 0 0 0 0 1 0 1 0 0 0 1 0 0 1 0 0 0 0 1 0 1 1 1 1 0 0 1 0 1 0 1 0 0 0 1 0 1 0 1 1 0 0 0 1 1 0 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 1 1 0 0 0 0 1 1 1 0 0 0 0 0 0 0 1 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 1 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 1 1 0 0 0 0 1 1 1 1 0 0 0 0 0 1 1 1 0 0 0 1 0 1 0 1 0 0 1 0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 0 1 1 0 0 0 1 1 1 1 0 0 0 0 0 0 1 0 1 1 0 0 0 0 1 0 1 0 0 0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 1 0 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 0 0 0 1 0 0 0 1 0 1 0 1 0 0 1 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 1 0 1 1 0 0 0 0 0 1 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 1 0 ];

iB_error = [];
error_B = [];
for i = 1:512
    if B_concat(1,i) ~=  B_tested(1,i)
        error_B = [error_B 1];
        iB_error = [iB_error i];
    else
        error_B = [error_B 0];
    end
end


%% Testing for C
C =[];

C(0+1) = B(0+1) + B(4+1);
C(1+1) = B(0+1) - B(4+1);

C(2+1) = B(2+1) + w(1+4)* B(6+1);
C(3+1) = B(2+1) - w(1+4)* B(6+1);

C(4+1) = B(1+1) + w(1+8)* B(5+1);
C(5+1) = B(1+1) - w(1+8)* B(5+1);

C(6+1) = B(3+1) + w(1+12)* B(7+1);
C(7+1) = B(3+1) - w(1+12)* B(7+1);

C(8+1) = B(8+1) + B(12+1);
C(9+1) = B(8+1) - B(12+1);

C(10+1) = B(10+1) + w(1+4)* B(14+1);
C(11+1) = B(10+1) - w(1+4)* B(14+1);

C(12+1) = B(9+1) + w(1+8)* B(13+1);
C(13+1) = B(9+1) - w(1+8)* B(13+1);

C(14+1) = B(11+1) + w(1+12)* B(15+1);
C(15+1) = B(11+1) - w(1+12)* B(15+1);

C(16+1) = B(16+1) + B(20+1);
C(17+1) = B(16+1) - B(20+1);

C(18+1) = B(18+1) + w(1+4)* B(22+1);
C(19+1) = B(18+1) - w(1+4)* B(22+1);

C(20+1) = B(17+1) + w(1+8)* B(21+1);
C(21+1) = B(17+1) - w(1+8)* B(21+1);

C(22+1) = B(19+1) + w(1+12)* B(23+1);
C(23+1) = B(19+1) - w(1+12)* B(23+1);

C(24+1) = B(24+1) + B(28+1);
C(25+1) = B(24+1) - B(28+1);

C(26+1) = B(26+1) + w(1+4)* B(30+1);
C(27+1) = B(26+1) - w(1+4)* B(30+1);

C(28+1) = B(25+1) + w(1+8)* B(29+1);
C(29+1) = B(25+1) - w(1+8)* B(29+1);

C(30+1) = B(27+1) + w(1+12)* B(31+1);
C(31+1) = B(27+1) - w(1+12)* B(31+1);

for i =1:32
    
    Cx= real(C(i));
    Cy= imag(C(i));
    

    Cx_bin(i,1:8)= d2bfixed(Cx);
   
    Cy_bin(i,1:8)= d2bfixed(Cy);
   
   C_bin(i,1:16) = [Cx_bin(i,1:8) , Cy_bin(i,1:8)];
end

C_concat = [C_bin(31+1,:), C_bin(23+1,:), C_bin(29+1,:), C_bin(21+1,:), C_bin(27+1,:), C_bin(19+1,:),C_bin(25+1,:),C_bin(17+1,:),C_bin(30+1,:),C_bin(22+1,:),C_bin(28+1,:),C_bin(20+1,:), C_bin(26+1,:),C_bin(18+1,:), C_bin(24+1,:),C_bin(16+1,:),C_bin(15+1,:), C_bin(7+1,:), C_bin(13+1,:),C_bin(5+1,:), C_bin(11+1,:),C_bin(3+1,:), C_bin(9+1,:),C_bin(1+1,:),C_bin(14+1,:),C_bin(6+1,:),C_bin(12+1,:), C_bin(4+1,:), C_bin(10+1,:),C_bin(2+1,:),C_bin(8+1,:),C_bin(0+1,:)];

C_tested = [1 0 0 0 0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 0 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 1 0 0 1 0 1 1 0 1 0 0 1 0 0 0 1 0 0 0 1 0 1 0 0 1 0 0 0 1 1 0 1 1 0 0 0 0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 1 1 1 0 1 1 0 0 0 1 0 0 1 1 0 1 1 0 1 0 1 0 0 0 0 1 0 0 1 1 0 0 1 1 0 0 0 0 0 0 0 1 1 1 0 0 0 0 1 0 1 1 1 0 0 1 0 0 1 0 1 1 0 0 1 1 0 0 0 1 0 0 0 1 1 1 0 1 0 0 0 0 1 1 0 0 0 0 0 1 1 0 1 1 0 0 0 1 1 1 0 0 0 0 0 0 0 1 1 1 0 1 0 1 1 0 0 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 1 0 0 1 1 0 0 1 1 1 0 0 0 1 0 1 1 1 0 1 0 0 0 0 1 0 0 0 1 0 0 1 0 1 0 0 1 0 1 1 1 0 0 0 0 0 1 0 1 0 0 0 1 0 1 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0 0 0 0 1 1 0 1 0 0 0 0 1 1 0 1 0 0 1 1 0 0 0 1 0 0 0 0 1 1 1 1 0 0 0 0 0 1 1 1 0 0 0 1 0 1 0 0 0 0 1 0 1 0 0 0 0 0 0 1 0 0 0 1 0 1 0 0 0 1 1 0 0 0 0 0 0 1 0 0 0 0 1 0 0 1 0 0 0 0 1 1 0 1 1 0 0 0 1 0 0 1 1 1 0 0 0 0 0 0 1 1 0 1 0 0 0 1 1 0 0 1 0 0 0 1 1 1 0 0 1 0 1 0 0 1 0 0 1 1 0 1 0 0 0 0 0 1 0 0 0 1 0 0 1 1 0 0 1 1 0 0 0 1 1 0 1 0 0 0 1 0 0 1 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 1 1 0 0 1 0 0 0 0 1 0 1 0 1 0 0 0 1 1 1 0 ];


error_C = [];
iC_error =[];
for i = 1:512
    if C_concat(1,i) ~=  C_tested(1,i)
        error_C = [error_C 1];
        iC_error = [iC_error i];
    else
        error_C = [error_C 0];
    end
end

%% Testing for D
D =[];

D(0+1) = C(0+1) + C(8+1);
D(1+1) = C(0+1) - C(8+1);

D(2+1) = C(2+1) + w(1+2)* C(10+1);
D(3+1) = C(2+1) - w(1+2)* C(10+1);

D(4+1) = C(4+1) + w(1+4)* C(12+1);
D(5+1) = C(4+1) - w(1+4)* C(12+1);

D(6+1) = C(6+1) + w(1+6)* C(14+1);
D(7+1) = C(6+1) - w(1+6)* C(14+1);

D(8+1) = C(1+1) + w(1+8)* C(9+1);
D(9+1) = C(1+1) - w(1+8)* C(9+1);

D(10+1) = C(3+1) + w(1+10)* C(11+1);
D(11+1) = C(3+1) - w(1+10)* C(11+1);

D(12+1) = C(5+1) + w(1+12)* C(13+1);
D(13+1) = C(5+1) - w(1+12)* C(13+1);

D(14+1) = C(7+1) + w(1+14)* C(15+1);
D(15+1) = C(7+1) - w(1+14)* C(15+1);

D(16+1) = C(16+1) + C(24+1);
D(17+1) = C(16+1) - C(24+1);

D(18+1) = C(18+1) + w(1+2)* C(26+1);
D(19+1) = C(18+1) - w(1+2)* C(26+1);

D(20+1) = C(20+1) + w(1+4)* C(28+1);
D(21+1) = C(20+1) - w(1+4)* C(28+1);

D(22+1) = C(22+1) + w(1+6)* C(30+1);
D(23+1) = C(22+1) - w(1+6)* C(30+1);

D(24+1) = C(17+1) + w(1+8)* C(25+1);
D(25+1) = C(17+1) - w(1+8)* C(25+1);

D(26+1) = C(19+1) + w(1+10)* C(27+1);
D(27+1) = C(19+1) - w(1+10)* C(27+1);

D(28+1) = C(21+1) + w(1+12)* C(29+1);
D(29+1) = C(21+1) - w(1+12)* C(29+1);

D(30+1) = C(23+1) + w(1+14)* C(31+1);
D(31+1) = C(23+1) - w(1+14)* C(31+1);

for i =1:32
    
    Dx= real(D(i));
    Dy= imag(D(i));
    

    Dx_bin(i,1:8)= d2bfixed(Dx);
   
    Dy_bin(i,1:8)= d2bfixed(Dy);
   
    D_bin(i,1:16) = [Dx_bin(i,1:8) , Dy_bin(i,1:8)];
end

D_concat = [D_bin(31+1,:), D_bin(15+1,:), D_bin(29+1,:), D_bin(13+1,:), D_bin(27+1,:), D_bin(11+1,:),D_bin(25+1,:),D_bin(9+1,:),D_bin(23+1,:),D_bin(7+1,:),D_bin(21+1,:),D_bin(5+1,:), D_bin(19+1,:),D_bin(3+1,:), D_bin(17+1,:),D_bin(1+1,:),D_bin(30+1,:), D_bin(14+1,:), D_bin(28+1,:),D_bin(12+1,:), D_bin(26+1,:),D_bin(10+1,:), D_bin(24+1,:),D_bin(8+1,:),D_bin(22+1,:),D_bin(6+1,:),D_bin(20+1,:), D_bin(4+1,:), D_bin(18+1,:),D_bin(2+1,:),D_bin(16+1,:),D_bin(0+1,:)];

D_tested = [0 0 0 0 1 1 1 1 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 1 0 1 0 1 0 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 1 1 0 0 0 1 0 1 0 0 0 0 0 1 1 0 1 0 0 1 1 1 1 1 0 1 0  1 0 0 0 0 1 0 0 1 0 0 1 0 1 0 0 0 1 1 0 1 0 0 0 0 0 1 0 1 1 1 0 0 1 0 1 0 0 1 0 0 1 1 1 0 0 1 0 0 1 0 0 1 0 0 0 0 1 1 0 1 0 1 0 0 1 0 0 1 1 1 0 1 0 0 1 0 0 0 0 1 0 1 1 1 0 0 0 1 0 0 0 0 1 0 0 1 1 1 0 1 0 0 0 1 0 1 1 1 0 1 0 1 0 0 0 1 0 1 1 0 1 0 1 0 0 0 0 0 1 1 1 0 1 0 0 0 0 1 0 0 0 1 0 1 0 0 1 1 1 0 0 0 1 0 1 1 1 1 0 0 0 0 0 0 1 0 0 1 0 1 0 1 1 0 0 0 0 0 0 1 1 1 0 1 0 0 0 1 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 1 0 1 0 0 1 1 1 0 0 0 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 1 0 0 0 1 0 1 0 0 0 0 1 1 0 1 1 1 0 1 0 1 1 0 0 1 0 0 0 1 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 0 1 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 0 0 0 0 0 1 1 0 1 0 1 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 1 1 0 0 1 0 0 0 0 1 0 0 1 1 1 1 0 0 0 0 0 0 0 1 1 1 0 0 1 1 0 0 0 1 0 0 0 1 0 1 0 1 0 1 0 0 1 1 0 0 0 0 1 0 0 1  0 0 0 0 0 0 1 1 1 0 0 0 0 1 1 0 0 0 0 0 0 1 0 1 1 ]; 

error_D = [];
iD_error =[];
for i = 1:512
    if D_concat(1,i) ~=  D_tested(1,i)
        error_D = [error_D 1];
        iD_error = [iD_error i];
    else
        error_D = [error_D 0];
    end
end

%% Testing for X
X =[];

X(0+1) =  D(0+1) + D(16+1);
X(16+1) = D(0+1) - D(16+1);

X(1+1) = D(2+1) + w(1+1)* D(18+1);
X(17+1) = D(2+1) - w(1+1)* D(18+1);

X(2+1) = D(4+1) + w(1+2)* D(20+1);
X(18+1) = D(4+1) - w(1+2)* D(20+1);

X(3+1) = D(6+1) + w(1+3)* D(22+1);
X(19+1) = D(6+1) - w(1+3)* D(22+1);

X(4+1) = D(8+1) + w(1+4)* D(24+1);
X(20+1) = D(8+1) - w(1+4)* D(24+1);

X(5+1) = D(10+1) + w(1+5)* D(26+1);
X(21+1) = D(10+1) - w(1+5)* D(26+1);

X(6+1) = D(12+1) + w(1+6)* D(28+1);
X(22+1) = D(12+1) - w(1+6)* D(28+1);

X(7+1) = D(14+1) + w(1+7)* D(30+1);
X(23+1) = D(14+1) - w(1+7)* D(30+1);

X(8+1) = D(1+1) + w(1+8)* D(17+1);
X(24+1) = D(1+1) - w(1+8)* D(17+1);

X(9+1) = D(3+1) + w(1+9)* D(19+1);
X(25+1) = D(3+1) - w(1+9)* D(19+1);

X(10+1) = D(5+1) + w(1+10)* D(21+1);
X(26+1) = D(5+1) - w(1+10)* D(21+1);

X(11+1) = D(7+1) + w(1+11)* D(23+1);
X(27+1) = D(7+1) - w(1+11)* D(23+1);

X(12+1) = D(9+1) + w(1+12)* D(25+1);
X(28+1) = D(9+1) - w(1+12)* D(25+1);

X(13+1) = D(11+1) + w(1+13)* D(27+1);
X(29+1) = D(11+1) - w(1+13)* D(27+1);

X(14+1) = D(13+1) + w(1+14)* D(29+1);
X(30+1) = D(13+1) - w(1+14)* D(29+1);

X(15+1) = D(15+1) + w(1+15)* D(31+1);
X(31+1) = D(15+1) - w(1+15)* D(31+1);

for i =1:32
    
    Xx= real(X(i));
    Xy= imag(X(i));
    

    Xx_bin(i,1:8)= d2bfixed(Xx);
   
    Xy_bin(i,1:8)= d2bfixed(Xy);
   
    X_bin(i,1:16) = [Xx_bin(i,1:8) , Xy_bin(i,1:8)];
end

X_concat = [X_bin(31+1,:), X_bin(30+1,:), X_bin(29+1,:), X_bin(28+1,:), X_bin(27+1,:), X_bin(26+1,:),X_bin(25+1,:),X_bin(24+1,:),X_bin(23+1,:),X_bin(22+1,:),X_bin(21+1,:),X_bin(20+1,:), X_bin(19+1,:),X_bin(18+1,:), X_bin(17+1,:),X_bin(16+1,:),X_bin(15+1,:), X_bin(14+1,:), X_bin(13+1,:),X_bin(12+1,:), X_bin(11+1,:),X_bin(10+1,:), X_bin(9+1,:),X_bin(8+1,:),X_bin(7+1,:),X_bin(6+1,:),X_bin(5+1,:), X_bin(4+1,:), X_bin(3+1,:),X_bin(2+1,:),X_bin(1+1,:),X_bin(0+1,:)];

X_tested =[0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 1 0 0 1 0 0 0 1 1 1 0 1 0 0 0 0 1 1 0 0 0 1 0 0 1 0 0 0 1 1 0 0 1 1 1 0 0 1 0 1 1 1 0 1 0 0 0 0 1 1 0 1 0 0 1 0 1 0 0 1 0 0 0 1 0 0 1 0 0 1 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0 0 1 0 1 0 0 1 1 1 1 1 0 1 1 0 0 1 0 1 1 1 1 1 0 0 1 0 0 1 1 1 0 0 1 0 0 1 1  1 1 0 0 0 1 1 1 1 0 1 1 0 1 1 0 0 0 0 1 0 1 0 0 0 0  0 0 0 1 1 1 1 0 0 0 1 0 1 0 1 0 0 0 1 0 1 1 0 0 0 0 0 1 1 0 1 0 0 0 1 1 0 1 1 0 0 1 0 1 1 0 1 0 0 0 1 0 0 0 1 0 0 0 1 1 1 1 1 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 1 0 1 0 0 0 1 1 0 0 1 0 0 0 1 0 0 0 1 0 0 1 1 0 1 0 1 0 0 0 1 1 1 0 1 0 0 0 1 0 1 0 1 0 0 1 1 1 0 1 0 0 0 0 0 1 1 0 1 0 1 1 0 0 1 0 1 0 0 1 0 0 0 0 1 0 1 1 1 1 1 1 0 0 0 1 1 1 1 0 0 1 1 0 0 0 0 0 1 1 0 0 1 1 0 0 0 0 1 0 0 1 0 0 0 0 1 0 1 1 0 1 0 0 1 0 0 1 1 1 0 0 0 1 1 0 0 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 1 1 0 0 1 0 0 1 0 0 0 1 1 1 1 0 0 0 1 1 1 1 1 1 1 1 1 0 1 1 1 0 1 0 0 1 0 0 1 1 1 0 1 0 0 1 1 0 1 0 0 0 1 1 0 0 1 0 1 1 1 1 0 1 0 0 0 1 1 1 1 0 0 0 0 1 0 0 1 0 ] ; 
%%X_tested = [0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 1 0 0 1 0 0 0 1 1 1 0 1 0 0 0 0 1 1 0 0 0 1 0 0 1 0 0 0 1 1 0 0 1 1 1 0 0 1 0 1 1 1 0 1 0 0 0 0 1 1 0 1 0 0 1 0 1 0 0 1 0 0 0 1 0 0 1 0 0 1 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0 0 1 0 1 0 0 1 1 1 1 1 0 1 1 0 0 1 0 1 1 1 1 1 0 0 1 0 0 1 1 1 0 0 1 0 0 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 1 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 1 1 1 0 0 0 1 0 1 0 1 0 0 0 1 0 1 1 0 0 0 0 0 1 1 0 1 0 0 0 1 1 0 1 1 0 0 1 0 1 1 0 1 0 0 0 1 0 0 0 1 0 0 0 1 1 1 1 1 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 1 0 1 0 0 0 1 1 0 0 1 0 0 0 1 0 0 0 1 0 0 1 1 0 1 0 1 0 0 0 1 1 1 0 1 0 0 0 1 0 1 0 1 0 0 1 1 1 0 1 0 0 0 0 0 1 1 0 1 0 1 1 0 0 1 0 1 0 0 1 0 0 0 0 1 0 1 1 1 1 1 1 0 0 0 1 1 1 1 0 0 1 1 0 0 0 0 0 1 1 0 0 1 1 0 0 0 0 1 0 0 1 0 0 0 0 1 0 1 1 0 1 0 0 1 0 0 1 1 1 0 0 0 1 1 0 0 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 1 1 0 0 1 0 0 1 0 0 0 1 1 1 1 0 0 0 1 1 1 1 1 1 1 1 1 0 1 1 1 0 1 0 0 1 0 0 1 1 1 0 1 0 0 1 1 0 1 0 0 0 1 1 0 0 1 0 1 1 1 1 0 1 0 0 0 1 1 1 1 0 0 0 0 1 0 0 1 0 ] ; 

error_X = [];
iX_error =[];
for i = 1:512
    if X_concat(1,i) ~=  X_tested(1,i)
        error_X = [error_X 1];
        iX_error = [iX_error i];
    else
        error_X = [error_X 0];
    end
end

%% Getting FFT

X_out_Hardware_dash = [];
X_out_Hardware_dash1 = [];
X_out_Hardware =[];
for i =1:64
    X_out_Hardware_dash(i,1) = b2dfixed(X_tested(1,(i-1)*8+1), X_tested(1,(i-1)*8+2), X_tested(1,(i-1)*8+3), X_tested(1,(i-1)*8+4), X_tested(1,(i-1)*8+5), X_tested(1,(i-1)*8+6), X_tested(1,(i-1)*8+7), X_tested(1,(i-1)*8+8));
end

for i =1:32
    X_out_Hardware_dash1(i,1) = X_out_Hardware_dash(2*i-1,1) + 1i * X_out_Hardware_dash(2*i,1);
end

for i =1:32
    X_out_Hardware(i,1) = X_out_Hardware_dash1(33-i,1);
end


X_butterfly = []; % output X of the butterfly-based FFT algorithm

for i = 1:32
    X_out_butterfly(i,1) =[X_butterfly; X(i)];
end

X_out_sim = transpose(fft(x)); %  % output X of the Simulation-based FFT algorithm

algoritm_accuracy_sim = (X_out_sim -  X_out_butterfly);

algoritm_accuracy_hardware = (X_out_butterfly -  X_out_Hardware);
