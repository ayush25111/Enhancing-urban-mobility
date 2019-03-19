	for m=1:n_j(1)
		if r1(m)==1
			o_ir2=o_j(m);
			e_ir2=e_ij(m);
			dist_oir2oj=getdist1(o_ir2, o_j);
			t_oir2oj=dist_oir2oj/s(y);
			
			e_ir2j=e_ir2 + t_oir2oj + c;
			for x=1:n_j(1)
				if e_ir2j(x) > e_j(x)
					e_jir2(x)=(e_ir2j(x) + t_oir2oj(x));
	
					dist_ojdj=getdist2(o_j, d_j);
					t_ojdj=dist_ojdj/s(y);
					l_jir2(x)=e_jir2(x)+c+t_ojdj(x);
					dist=getdist1(d_i(y), d_j);
					t_djdi=dist/s(y);
					l_ir2j(x)=l_jir2(x)+t_djdi(x);
				else
					l_jir2(x)=-Inf;
					l_ir2j(x)=-Inf;
				end
			end
		end
	end
	tripduration_ir2=l_ir2j-e_ir2j
			for n=1:n_j(1)
				if (tripduration_ir2(n)<=T_i(y) && l_jir2(n)<=l_j(n) && l_ir2j(n)<=l_i(y))
					disp('Matched');
					r2(n)=1;
				else 
					disp('Not matched');
					r2(x)=0;
				end	
			end
			r2
	
	
	
