% input of valid partite graph and coressponding value_mat(driver, rider, weight,delta(extra distance by driver)) 
% prefered different value array for each driver.
% we will make combination array from given graph then will calculate z1,z2
% for these combination for the final solution.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = optimize(value_mat) 

ndriv = size(unique(value_mat(:,1))); %%%number of drivers
sval =size(value_mat);    %%% size of value matrices
combos= nchoosek(1:sval,ndriv(1));
u = value_mat;

[~,idx] = sort(u(:,1)); % sort just the first column
sortedmat = u(idx,:);%sort row according previous

siz = size(combos);
selected=zeros(1,ndriv(1)+2);
%syms selected
for i=1:1:siz(1)
    str =0;
    temp=[0,0,0,0];
     rid=[0,0];
     flag2 =0;
    for k=1:1:siz(2)
        %% riders check
        if sortedmat(combos(i,k),2)==0
           rid(k,1:2)=[sortedmat(combos(i,k),1),sortedmat(combos(i,k),2)];
        str(k) = combos(i,k);   % rider picked
        flag2 =1;
        else
        rid(k,1:2)=[sortedmat(combos(i,k),1),ndriv(1)+sortedmat(combos(i,k),2)];
        str(k) = combos(i,k);  % rider picked
        end
        if k==1
          temp(1,:) = sortedmat(combos(i,k),:);   
        else
        z_pass =size(temp);
        temp(z_pass(1)+1,:) = sortedmat(combos(i,k),:);
        end
    end
        srid = size(unique(rid));
        if (srid(1) == nnz(rid)+1 && flag2 == 1) || (srid(1) == nnz(rid)&& flag2 ==0)
        %% validity or compatibility check        
        %% z1 z2 calculations

        a1 = z1(temp);
        a2 = z2(temp);
        size_sel = size(selected);        
          for qq = 1:1:ndriv(1)+2
              selected(size_sel(1)+1,1) = a1;
              selected(size_sel(1)+1,2) = a2;
              if qq > 2
              selected(size_sel(1)+1,qq) = str(1,qq-2);
              end
       
          end
        end
end
%sortedmat
%selected
anst = min_mat(max_mat(selected));
sans = size(anst);
fprintf('---------Optimizied Solution/s---------------\n');

for k =1:1:sans
fprintf('-------------------Case %d-------------------\n',k);
for i = 1:1:ndriv(1)
    if sortedmat(anst(k,2+i),2) > 0
   fprintf('Driver %d can take rider %d\n',i,sortedmat(anst(k,2+i),2));
    else
   fprintf('Driver %d can go alone\n',i);   
    end
end
fprintf('---------------------------------------------\n');
end







