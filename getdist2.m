function [dist] = getdist2(o, d)

fid=fopen('input/dist.txt');
all=textscan(fid, '%f %f %f', 'delimiter', ' ', 'EmptyValue', -Inf);
fclose(fid);

s2=size(d);
s3 = size(all{1});

dist=zeros(size(d));
for j=1:1:s2(1)
	for k=1:1:s3(1)
		if ((o(j)==all{1}(k) && d(j)==all{2}(k)) || (d(j)==all{1}(k) && o(j)==all{2}(k)))
			dist(j) = all{3}(k);
			break;
		else
			dist(j) = -Inf;
		end
	end
end
%dist=dist';
end