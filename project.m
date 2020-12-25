% 題目:請找到一個正數使得此數字的平方長相如下:
% 1_2_3_4_5_6_7_8_9_0
% 其中每個 _ 都是一個數字。

% 答案:
% x=1389019170
% x^2=1929374254627488900


% 想法:(詳情請見README)
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
% find y

%%
% find y1
jj=0;
for ii=1:99
    a=(ii*10+3);
    b=a^2;
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
    b=a^2;
    str=num2str(b);
    if(str(end-2)=='8')
        jj=jj+1;
        z1(jj)=a;
    end
end


%%
% find y2
for kk=1:size(y1,2)
    jj=0;
    for ii=1:99
        a=(ii*1000+y1(kk));
        b=a^2;
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
        b=a^2;
        str=num2str(b);
        if(str(end-4)=='7')
            jj=jj+1;
            z2(kk,jj)=a;
        end
    end
end
% 0就是代表沒有找到


%%
% find y3
for kk=1:size(y2,1)
    for ll=1:size(y2,2)
        jj=0;
        for ii=1:99
            a=(ii*10^5+y2(kk,ll));
            b=a^2;
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
            a=(ii*10^5+z2(kk,ll));
            b=a^2;
            str=num2str(b);
            if(str(end-6)=='6')
                jj=jj+1;
                z3(kk,ll,jj)=a;
            end
        end
    end
end


%%
% find y4
for kk=1:size(y3,1)
    for ll=1:size(y3,2)
        for mm=1:size(y3,3)
            jj=0;
            for ii=1:99
                if y3(kk,ll,mm)==0
                    continue
                end
                a=(ii*10^7+y3(kk,ll,mm));
                b=a^2;
                str=num2str(mod(b,10^9)-mod(b,10^8));
                if(str(1)=='5')
                    jj=jj+1;
                    y4(kk,ll,mm,jj)=a;
                end
            end
        end
    end
end

% find z4
for kk=1:size(z3,1)
    for ll=1:size(z3,2)
        for mm=1:size(z3,3)
            jj=0;
            for ii=1:99
                if z3(kk,ll,mm)==0
                    continue
                end
                a=(ii*10^7+z3(kk,ll,mm));
                b=a^2;
                str=num2str(mod(b,10^9)-mod(b,10^8));
                if(str(1)=='5')
                    jj=jj+1;
                    z4(kk,ll,mm,jj)=a;
                end
            end
        end
    end
end


%%
% find y from y4
jj=0;
for kk=1:size(y4,1)
    for ll=1:size(y4,2)
        for mm=1:size(y4,3)
            for nn=1:size(y4,4)
                a=y4(kk,ll,mm,nn);
                b=a^2;
                if(a==0)
                    continue
                end
                if(b < 2*10^16 && b > 10^16)
                    str1=num2str(mod(b,10^11)-mod(b,10^10));
                    if(str1(1)=='4')
                        str2=num2str(mod(b,10^13)-mod(b,10^12));
                        if(str2(1)=='3')
                            str3=num2str(mod(b,10^15)-mod(b,10^14));
                            if(str3(1)=='2')
                                jj=jj+1;
                                y(jj)=a;
                            end
                        end
                    end
                end                              
            end
        end
    end
end

% find y from z4
for kk=1:size(z4,1)
    for ll=1:size(z4,2)
        for mm=1:size(z4,3)
            for nn=1:size(z4,4)
                a=z4(kk,ll,mm,nn);
                b=a^2;
                if(a==0)
                    continue
                end
                if(b < 2*10^16 && b > 10^16)
                    str1=num2str(mod(b,10^11)-mod(b,10^10));
                    if(str1(1)=='4')
                        str2=num2str(mod(b,10^13)-mod(b,10^12));
                        if(str2(1)=='3')
                            str3=num2str(mod(b,10^15)-mod(b,10^14));
                            if(str3(1)=='2')
                                jj=jj+1;
                                y(jj)=a;
                            end
                        end
                    end
                end                              
            end
        end
    end
end


format long
x=10.*y         % x=1.389019170000000e+09
z=x^2           % z=1.929374254627489e+18
% 用眼睛看，可以確認到1_2_3_4_5_6_7_8
% 因為machine epsilon=10^(-16))，所以-9-0用數學去驗
