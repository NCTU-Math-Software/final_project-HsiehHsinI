# Project 11-平方數


## 題目: *(project11.m)*
請找到一個正數使得此數字的平方長相如下:

1_2_3_4_5_6_7_8_9_0

其中每個 _ 都是一個數字。

## 答案:
x=1389019170

x^2=1929374254627488900

## 想法:
1. 假設x是我們要找的正數
>(x=__________,x^2=1_2_3_4_5_6_7_8_9_0)
2. 因為只有0*0=0，所以x的最後一位一定是0，所以x^2最後兩位一定是00。
3. 不妨假設x=y*10，則
>(x=____y___0, x^2=______y^2_______00)

>(y=________, y^2=1_2_3_4_5_6_7_8_9)
4. 因為3和7的平方尾數是9，所以x的十位數可能是3或7。
5. 我要一次兩位兩位加來考慮，因為我加兩位不會影響到最後幾位的結果
>(a*100+b)^2=10000*(a^2)+100*a*b+b^2
6. 所以我要找y1=--3 使得 y1^2 =---8-9 和 z1=--7 使得 z1^2 =---8-9,  - 是一個介於0~9的數字
>y1=--3, y1^2 =---8-9

>z1=--7, z1^2 =---8-9
7. 同理，找到以後再找y2=--y1 使得 y2^2 =-----7-8-9 和 z2=--z1 使得 z2^2 =-----7-8-9,  - 是一個介於0~9的數字
>y2=--y1, y2^2 =-----7-8-9

>z2=--z1, z2^2 =-----7-8-9
8. 繼續找y3=--y2 使得 y3^2 =-------6-7-8-9 和 z3=--z2 使得 z3^2 =-------6-7-8-9,  - 是一個介於0~9的數字
>y3=--y2, y3^2 =-------6-7-8-9

>z3=--z2, z3^2 =-------6-7-8-9
9. 再找最後一次，找y4=--y3 使得 y3^2 =-----------5-6-7-8-9 和 z4=--z3 使得 z3^2 =-----------5-6-7-8-9
>y4=--y3, y3^2 =-----------5-6-7-8-9

>z4=--z3, z3^2 =-----------5-6-7-8-9
10. 最後，再從找到的這些y3, z4中，先把範圍在2*10^16~10^16挑出來，再一一確認剩餘的2_3_4，符合的數就是我們要的 y，再乘上10就是我要的x

## 補充:
1. 因為電腦的machine epsilon是10^(-16)且是用科學記號存取，所以我們能用眼睛確認的只能到1_2_3_4_5_6_7_8，最後的_9_0用前面解釋的數學確認
2. 我的程式能在5秒內算出來

## 變化: *(kCarry.m)*
### 數字以k進位表示，k=8，找到一個正數使得此數字的平方長相如下: 7_6_5_4_3_2_1_0

### 答案(以8進位表示):
ak = 25672770

ak^2 = 736054473120100

### 做法:
1. 大致與十進位的差不多
2. 只是在計算平方時，是先換成十進位，平方後，再換回8進位
