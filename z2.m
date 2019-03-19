function [z2_out] = z2(selection)
temo = 0;
tempre = 0;
s = size(selection);
for i = 1:1:s(1)
temo  = tempre + selection(i,4);
tempre = temo;
end
z2_out = temo;
end