global val sts
d1 =[1,2];
d2 =[4,5];
d3 =[7,6,7];
d =zeros(3,3);
combos= nchoosek(1:cvv,3)
cv = sts(1);
cvv =size(val);
df =zeros(1,cv);
u = val;
[~,idx] = sort(u(:,1)); % sort just the first column
sortedmat = u(idx,:);
sortedmat
for i=1:1:cv
    for k = 1:1:cvv(1)
        if sortedmat(k,1) ==i
        df(i)= df(i)+1;
        end
    end
end
df