%combination array : z1, z2, selected value element. 

function [max] = max_mat( combi )
tmax = combi(1,1);
siz = 1;
rm = size(combi);
for i=1:1:rm(1)
    if tmax < combi(i,1)
        siz = 1;
        tmax = combi(i,1);
        temo(siz,:) = combi(i,:);
        siz = siz + 1;
    elseif combi(i,1) == tmax
        temo(siz,:) = combi(i,:);
        siz = siz + 1;   
    end
   
end
max = temo(1:siz-1,:);
end

