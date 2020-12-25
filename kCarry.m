% 變化:數字以k進位表示，k=8，找到一個正數使得此數字的平方長相如下:7_6_5_4_3_2_1_0

k=8;
% check 0
jj=0;
for ii=0:k-1
     x0=ii;       % 10 進位
     y0=x0^2;      % 10 進位
     yk=dec2base(y0,k);
     if (yk(end)=='0')
         jj=jj+1;
         ak1(jj)=str2num(dec2base(x0,k));      % k 進位
     end
end
ak1;

% check 1_0 
for mm=1:size(ak1,2)
     jj=0;
     for ll=1:k-1
         for ii=1:k-1
             xk=ii*10^(2)+ll*10+ak1(mm);        % k 進位
             x0=base2dec(num2str(xk),k);        % 10 進位
             y0=x0^2;                           % 10 進位
             yk=dec2base(y0,k);                 % k 進位
             if (yk(end-2)=='1')
                 jj=jj+1;
                 ak2(mm,jj)=xk;
             end
         end
     end
end
ak2;
% _4已被淘汰

% check 2_1_0
for mm=1:size(ak2,2)
     jj=0;
     for ll=1:k-1
         for ii=1:k-1
             xk=ii*10^(4)+ll*10^(3)+ak2(mm);    % k 進位
             x0=base2dec(num2str(xk),k);        % 10 進位
             y0=x0^2;                           % 10 進位
             yk=dec2base(y0,k);                 % k 進位
             if (yk(end-4)=='2')
                 jj=jj+1;
                 ak3(mm,jj)=xk;
             end
         end
     end
end
ak3;


% check 3_2_1_0
for nn=1:size(ak3,1)
    for mm=1:size(ak3,2)
         jj=0;
         for ll=1:k-1
             for ii=1:k-1
                 if ak3(nn,mm)==0
                    continue
                 end
                 xk=ii*10^(6)+ll*10^(5)+ak3(nn,mm);    % k 進位
                 x0=base2dec(num2str(xk),k);        % 10 進位
                 y0=x0^2;                           % 10 進位
                 yk=dec2base(y0,k);                 % k 進位
                 if (yk(end-6)=='3')
                     jj=jj+1;
                     ak4(nn,mm,jj)=xk;
                 end
             end
         end
    end
end
ak4;
%a0=base2dec(num2str(7676770),k);
%bk=dec2base(a0^2,k)

% check 4_3_2_1_0
for pp=1:size(ak4,1)
    for nn=1:size(ak4,2)
        for mm=1:size(ak4,3)
             jj=0;
             for ll=1:k-1
                 for ii=1:k-1
                     if ak4(pp,nn,mm)==0
                        continue
                     end
                     xk=ii*10^(8)+ll*10^(7)+ak4(pp,nn,mm);    % k 進位
                     x0=base2dec(num2str(xk),k);              % 10 進位
                     y0=x0^2;                                 % 10 進位
                     yk=dec2base(y0,k);                       % k 進位
                     if (yk(end-8)=='4')    
                         jj=jj+1;
                         ak5(pp,nn,mm,jj)=xk;
                     end
                 end
             end
        end
    end
end
ak5;
