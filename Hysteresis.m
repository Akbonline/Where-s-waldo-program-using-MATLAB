%% Hysteresis and Edge-Linking algorithm
% Step 1: Creating 1D array containing all the values to sort
% Step 2: Calculating higher and lower boundaries
% Step 3: REturning a list of update Hysterisis and Edge values
function [Hystersis,edge_matrix] = Hysteresis(supress,rows,cols,percent)
    supressed_list=[];
    for x=1:rows
        for y=1:cols
            supressed_list=[supressed_list supress(x,y)];
        end
    end
    supress_sort=sort(supressed_list);   %Sorting the supress list rows
    high_index=round((percent/100)*length(supress_sort));
    high=supress_sort(high_index);
    low=0.2*high;
    Hystersis=supress;
    for x=1:rows
        for y=1:cols
            if Hystersis(x,y)>high
                Hystersis(x,y)=255;
            elseif Hystersis(x,y)>low
                Hystersis(x,y)=125;
            else
                Hystersis(x,y)=0;
            end
        end
    end
    edge_matrix=Hystersis;
    for x=1:rows
        for y=1:cols
            if Hystersis(x,y)==125
            ON=Nearest_eight(Hystersis,x,y,rows,cols);
                if ON==255
                 edge_matrix(x,y)=255;
                else 
                 edge_matrix(x,y)=0;
                end
            end
        end
    end
end

