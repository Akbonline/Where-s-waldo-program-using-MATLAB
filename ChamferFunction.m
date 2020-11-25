%% Calculating Chamfer Distance from the edge matrix
% The algorithm consists of 2 passes 
% Pass 1: Starting from 00 to end
% Using the formula : Chamfer(x,y)=min(Inf,1+Chamfer(x-1,y),1+Chamfer(x,y-1));
% Pass 2: Starting from end to 00
% Using the formula: Chamfer(x,y)=min(Inf,1+Chamfer(x-1,y),1+Chamfer(x,y-1));
function [Chamfer_Distance] = ChamferFunction(edge_matrix)
    [rows,cols]=size(edge_matrix);
    Chamfer_Distance=zeros(rows,cols);
    % First pass
    for x=1:rows
        for y=1:cols        
            if x==1 && y==1
                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=1e50;
                end
            end        
            if x==1 && y>1
                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=min([1e50 1e50 1+Chamfer_Distance(x,y-1)]);
                end            
            end
            if x>1 && y==1
                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=min([1e50 1e50 1+Chamfer_Distance(x-1,y)]);
                end
            end        
            if x>1 && y>1
                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=min([1e50 1e50 1+Chamfer_Distance(x-1,y)]);
                end
            end
        end
    end
    % Second pass
    for x=rows:-1:1
        for y=cols:-1:1
            if x==rows && y==cols
                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=Chamfer_Distance(x,y);
                end
            end
            if x==rows && y<cols
                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=min([Chamfer_Distance(x,y) 1+Chamfer_Distance(x,y+1) 1e50]);
                end
            end
            if x<rows && y==cols
                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=min([Chamfer_Distance(x,y) 1+Chamfer_Distance(x+1,y) 1e50]);
                end
            end
            if x==1 && y==cols

                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=min([Chamfer_Distance(x,y) 1+Chamfer_Distance(x+1,y) 1e50]);
                end
            end
            if x==1 && y<cols
                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=min([Chamfer_Distance(x,y) 1+Chamfer_Distance(x+1,y) 1+Chamfer_Distance(x,y+1)]);
                end
            end
            if x<rows && y<cols
                if edge_matrix(x,y)==255
                    Chamfer_Distance(x,y)=0;
                else
                    Chamfer_Distance(x,y)=min([Chamfer_Distance(x,y) 1+Chamfer_Distance(x+1,y) 1+Chamfer_Distance(x,y+1)]);
                end
            end
        end
    end
end