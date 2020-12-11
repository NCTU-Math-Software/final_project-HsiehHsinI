% x=____y___0, x^2=______y^2_______00
% y=________, y^2=1_2_3_4_5_6_7_8_9
% y1=--3, y1^2 =---8-9
% z1=--7, z1^2 =---8-9
% y2=--y1, y2^2 =-----7-8-9
% z2=--z1, z2^2 =-----7-8-9
% y3=--y2, y3^2 =-------6-7-8-9
% z3=--z2, z3^2 =-------6-7-8-9

% find y1
jj=0;
for ii=1:99
    a=(ii*10+3);
    b=(ii*10+3)^2;
    str=num2str(b);
    if(str(end-2)=='8')
        jj=jj+1;
        y1(jj)=a;
    end
end

% find z1
jj=0;
for ii=1:99
    a=(ii*10+7);
    b=(ii*10+7)^2;
    str=num2str(b);
    if(str(end-2)=='8')
        jj=jj+1;
        z1(jj)=a;
    end
end

% find y2
for kk=1:size(y1,2)
    jj=0;
    for ii=1:99
        a=(ii*1000+y1(kk));
        b=(ii*1000+y1(kk))^2;
        str=num2str(b);
        if(str(end-4)=='7')
            jj=jj+1;
            y2(kk,jj)=a;
        end
    end
end

% find z2
for kk=1:size(z1,2)
    jj=0;
    for ii=1:99
        a=(ii*1000+z1(kk));
        b=(ii*1000+z1(kk))^2;
        str=num2str(b);
        if(str(end-4)=='7')
            jj=jj+1;
            z2(kk,jj)=a;
        end
    end
end
