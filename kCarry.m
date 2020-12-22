function kCarry(k)
    % find a such that a^2 forms 1_2_..._k-1_0
    % k<=10
    % input k, positive integer
    % output a, a k-carry number with a^2 forms 1_2_..._k-1_0
    % example: kCarry(2)
    
    jj=0;
    for ii=0:k-1
        x0=ii;       % 10 ¶i¦ì
        y0=x0^2;      % 10 ¶i¦ì
        yk=dec2base(y0,k);
        if (yk(end)=='0')
            jj=jj+1;
            ak1(jj)=str2num(dec2base(x0,k));      % k ¶i¦ì
        end
    end
    
    jj=0;
    for nn=1:floor(k/2)
        for mm=1:size(ak1,2)
            for ll=1:k
                for ii=1:k
                    xk=ii*k^(l+2)+ll*k^(l+1)+ak1(jj);        % k ¶i¦ì
                    x0=base2dec(xk,k);                       % 10 ¶i¦ì
                    y0=x0^2;
                    yk=dec2bace(y0,k);
                    if (yk(end-1)==num2str(k-1))
                        jj=jj+1;
                        ak2(mm,jj)=xk;
                end
            end
        end
    end
end