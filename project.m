% x=____y___0, x^2=______y^2_______00
% y=________, y^2=1_2_3_4_5_6_7_8_9
% y1=--3, y1^2 =---8-9
% z1=--7, z1^2 =---8-9
% y2=--y1, y2^2 =-----7-8-9
% z2=--z1, z2^2 =-----7-8-9
% y3=--y2, y3^2 =-------6-7-8-9
% z3=--z2, z3^2 =-------6-7-8-9
% y4=--y3, y3^2 =-----------5-6-7-8-9
% z4=--z3, z3^2 =-----------5-6-7-8-9

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
% 0就是代表沒有找到

% find y3
for kk=1:size(y2,1)
    for ll=1:size(y2,2)
        jj=0;
        for ii=1:99
            a=(ii*100000+y2(kk,ll));
            b=(ii*100000+y2(kk,ll))^2;
            str=num2str(b);
            if(str(end-6)=='6')
                jj=jj+1;
                y3(kk,ll,jj)=a;
            end
        end
    end
end

% find z3
for kk=1:size(z2,1)
    for ll=1:size(z2,2)
        jj=0;
        for ii=1:99
            a=(ii*100000+z2(kk,ll));
            b=(ii*100000+z2(kk,ll))^2;
            str=num2str(b);
            if(str(end-6)=='6')
                jj=jj+1;
                z3(kk,ll,jj)=a;
            end
        end
    end
end

% find y4
for kk=1:size(y3,1)
    for ll=1:size(y3,2)
        for mm=1:size(y3,3)
            jj=0;
            for ii=1:99
                a=(ii*10000000+y3(kk,ll,mm));
                b=(ii*10000000+y3(kk,ll,mm))^2;
                str=num2str(b);
                if(str(end-8)=='5')
                    jj=jj+1;
                    y4(kk,ll,mm,jj)=a;
                end
            end
        end
    end
end

% 有0的會有問題，if...
