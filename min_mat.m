%combination array : z1, z2, selected value element. 

function [min] = min_mat( combi )
tmin = combi(1,2);
siz = 1;
rm = size(combi);
for i=1:1:rm(1)
    if tmin > combi(i,2)
        siz = 1;
        tmin = combi(i,2);
        temo(siz,:) = combi(i,:);
        siz = siz + 1;
    elseif combi(i,2) == tmin
        temo(siz,:) = combi(i,:);
        siz = siz + 1;   
    end
   
end
min = temo(1:siz-1,:);
end

