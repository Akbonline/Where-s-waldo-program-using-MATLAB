%% Sum of squared Distance:

function [output] = sum_of_squared_dist(chamfer1,chamfer2)
    [rows,cols,n1]=size(chamfer1);
    [h,w,n2]=size(chamfer2);
    [s,l1,l2] = deal(0,0,0);
    output(rows,cols)=Inf;
    for i=1:rows
        for j=1:cols  
            for k=1:h
                for m=1:w
                    if k+i<=rows && m+j<=cols
                        s=s+(chamfer1(k+i,m+j)-chamfer2(k,m)).^2;
                    end
                end
            end
            if k+i<=rows && m+j<=cols
                output(i,j)=s;
            else
                output(i,j)=Inf;
            end
            s=0; 
        end
    end
end