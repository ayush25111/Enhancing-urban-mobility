
function [z1_out] = z1(selection)
temo = 0;
tempre = 0;
s = size(selection);
for i = 1:1:s(1)
temo =tempre + selection(i,3);
tempre=temo;
end
z1_out = temo;
end

