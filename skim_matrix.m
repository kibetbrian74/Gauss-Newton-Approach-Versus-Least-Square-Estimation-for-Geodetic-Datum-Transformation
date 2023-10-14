function output = skim_matrix( data )
%Skimms through a matrix to identify each element in each row and column
[r, c] = size(data);
for i=1:r
    for j=1:c
        elements=data(i,j);
        output = fprintf('row%d,column%d \t%d,\t',i,j,elements);
        format long;
    end
    fprintf('\n');
end