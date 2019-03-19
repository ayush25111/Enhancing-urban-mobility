% m=textscan(fid, '%f %c %c %f %f %f %f', 'delimiter', ' ', 'EmptyValue', -Inf)

fid1=fopen('input/driver.txt');
fid2=fopen('input/rider.txt');
D=textscan(fid1, '%f %f %f %f %f %f %f', 'delimiter', ' ', 'EmptyValue', -Inf);
R=textscan(fid2, '%f %f %f %f %f', 'delimiter', ' ', 'EmptyValue', -Inf);
fclose(fid1);
fclose(fid2);

rideshare(D, R);
