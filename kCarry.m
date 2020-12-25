% 變化:
% 數字以k進位表示，k=8
% 找到一個正數使得此數字的平方長相如下:
% 7_6_5_4_3_2_1_0
% 其中每個 _ 都是一個數字

% 答案:(8進位表示)
% ak = 25672770
% ak^2 = 736054473120100

% 想法: 和十進位的差不多
% 只是在計算平方時，是先換成十進位算完再換回來


k=8;
% check 0
jj=0;
for ii=0:k-1
     x0=ii;                 % 10 進位
     y0=x0^2;               % 10 進位
     yk=dec2base(y0,k);
     if (yk(end)=='0')
         jj=jj+1;
         ak1(jj)=ii;        % k 進位
     end
end

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
                 x0=base2dec(num2str(xk),k);           % 10 進位
                 y0=x0^2;                              % 10 進位
                 yk=dec2base(y0,k);                    % k 進位
                 if (yk(end-6)=='3')
                     jj=jj+1;
                     ak4(nn,mm,jj)=xk;
                 end
             end
         end
    end
end

% check 4_3_2_1_0
for pp=1:size(ak4,1)
    for nn=1:size(ak4,2)
        for mm=1:size(ak4,3)
             jj=0;
             for ii=1:k-1
                 if ak4(pp,nn,mm)==0
                    continue
                 end
                 xk=ii*10^(7)+ak4(pp,nn,mm);        % k 進位
                 x0=base2dec(num2str(xk),k);        % 10 進位
                 y0=x0^2;                           % 10 進位
                 yk=dec2base(y0,k);                 % k 進位
                 if (yk(end-8)=='4')    
                     jj=jj+1;
                     ak5(pp,nn,mm,jj)=xk;
                 end
             end
        end
    end
end

% find ak
jj=0;
for nn=1:size(ak5,1)
    for mm=1:size(ak5,2)
        for ll=1:size(ak5,3)
            for ii=1:size(ak5,4)
                if ak5(nn,mm,ll,ii)==0
                    continue
                end
                xk=ak5(nn,mm,ll,ii);               % k 進位
                x0=base2dec(num2str(xk),k);        % 10 進位
                y0=x0^2;                           % 10 進位
                yk=dec2base(y0,k);                 % k 進位
                if (str2num(yk) < 8*10^14 && str2num(yk) > 7*10^14 )
                    if yk(3)=='6'
                        if yk(5)=='5'
                            jj=jj+1;
                            ak(jj)=xk;
                        end
                    end
                end
            end
        end
    end
end

a0=base2dec(num2str(ak),k);
bk=dec2base(a0^2,k);            
disp(['ak = ',num2str(ak)])     % 答案 ak = 25672770
disp(['ak^2 = ',bk])            % ak^2(8進位) = 736054473120100
