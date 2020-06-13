clc;close all;clear all;
lmda=8.0;% your choice lamda
price=1.0;
pos=0;
neg=0;
[lmda,set,y11,y22,y33]=por2(lmda,price);
a1=lmda;
format short G
y23=y11+y22+y33;
disp('       Lamda |       Error   |    P1   |       P2     |     P3     |  Total Power ')
a2=[a1 set y11 y22 y33 y23];
disp(a2)
for i=0:100;
if (set>0 && set<1)
    disp('Zero is answer')
    break;
elseif(set>0)
    if (neg>=1)
        lmda2=lmda;
        set2=set;
     break;
    end
    lmda1=lmda;
    set1=set;
    lmda = lmda+(lmda/10);
    pos=pos+1;
    [lmda, set,y11,y22,y33]=por2(lmda,price);
    a1=lmda;
%disp('     Lamda |  Error   | P1 |       P2 |     P3 |')
a1=lmda;
format short G
y23=y11+y22+y33;
a2=[a1 set y11 y22 y33 y23];
disp(a2)
      %disp(pos)
      %disp(set)
elseif(set<0)
    if (pos>=1)
        lmda2=lmda;
        set2=set;
     break;
    end
    lmda1=lmda;
    set1=set;
    lmda = lmda-(lmda/10);
    neg=neg+1;
    [lmda, set]=por2(lmda,price);   
        %disp(neg)
        %disp(set)
 end
end
lmda3 = @(lmda1,lmda2,set1,set2) (((lmda2-lmda1)/(set1-set2))*set2+lmda2);
%disp(a1)
%disp(lmda1)
%disp(lmda2)
%disp(a2)
%disp(set1)
%disp(set2)
z1=lmda3(lmda1,lmda2,set1,set2);
[lmda,set ,y11,y22,y33]=por2(z1,price);
a1=lmda;
format short G
y23=y11+y22+y33;
a2=[a1 set y11 y22 y33 y23];
disp(a2)
c=0.0001;
for i=0:0.0001:50;
if (set>=0.00001)
    %disp(set)
    %disp('Zero is answer')
        a1=lmda;
format short G
y23=y11+y22+y33;
a2=[a1 set y11 y22 y33 y23];
disp(a2)
    break;
else
    lmda = lmda-c;
    [lmda, set,y11,y22,y33]=por2(lmda,price);

    c=c+0.0001;
end
end

      %disp(pos)
%y11=double(y11);
%y22=double(y22);
%y33=double(y33);
%disp(z1)
%disp(set)
%disp(lmda)
%disp(set)
%disp(y11)
%disp(y22)
%disp(y33)
