%%open line by line but get char values
fid = fopen('input/driver.txt');
tline = fgetl(fid);
while ischar(tline)
    disp(tline);
    tline = fgetl(fid);
end
fclose(fid);