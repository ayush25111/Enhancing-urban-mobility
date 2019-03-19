function [] = rideshare(D, R)
%RIDESHARE Summary of this function goes here

% to find e_ij=departure of driver i matched with rider j
% driver i :
% rider j : 
% o_a=origin location of trip announcement 

% DEPENDS
% sig_j=announcement submission, e_j=earliest departure time, t_oioj=trip duration from o_i to o_j,
% s= average speed(in kmph)
%sig_i(announce), o_i(origin), d_i(dest.), e_i(earlist departure), l_i(latest arrival), s(speed), T_i(trip time)

sig_i=D{1};
o_i=D{2};
d_i=D{3};
e_i=D{4};
l_i=D{5};
s=D{6};
T_i=D{7};
n_i=size(sig_i);

sig_j=R{1};
o_j=R{2};
d_j=R{3};
e_j=R{4};
l_j=R{5};
n_j=size(sig_j);

c=0.05;
M=[0 0 0 0];

for y=1:n_i(1)

	dist_oioj=getdist1(o_i(y), o_j);
	
	t_oioj=dist_oioj/s(y);

	e_ij=zeros(n_j);
	for x=1:n_j(1)
		e_ij(x)=max(max(e_i(y), sig_j(x)), e_j(x)-t_oioj(x));
	end

	e_ji=e_ij+t_oioj;
	dist_ojdj=getdist2(o_j, d_j);
	t_ojdj=dist_ojdj/s(y);
	l_ji=e_ji+c+t_ojdj;
	
	dist_djdi=getdist1(d_i(y), d_j);
	t_djdi=dist_djdi/s(y);
	l_ij=l_ji+t_djdi;
	
	tripduration_i=l_ij-e_ij;

	r1=zeros(n_j);
	for x=1:n_j(1)
		if (tripduration_i(x)<=T_i(y) && l_ji(x)<=l_j(x) && l_ij(x)<=l_i(y))
			fprintf('Driver %d matches with rider %d.\n', y, x);
			r1(x)=1;
		else 
			fprintf('Driver %d doesn`t matches with rider %d.\n', y, x);
			r1(x)=0;
		end
	end
	d1=getdist1(o_i(y), d_i);
	for x=1:n_j(1)
		if r1(x)==1
			d=dist_oioj(x)+dist_ojdj(x)+dist_djdi(x)-d1(y);
			M=[M;y x 1 d];
		end
	end
	M=[M;y 0 0 0];
end
M((1),:)=[];
%M
%int64(val(:,1))
optimize(M); %%
end
