%% Nearest 8 Algorithm:
function [output] = Nearest_eight(Hystersis,x,y,rows,cols)
    curr=0;
    if x==1 && y==1 
        if Hystersis(x+1,y)==255||Hystersis(x+1,y+1)==255||Hystersis(x,y+1)==255
                curr=255;
        end
    end
    if x==1 && y>=2 
        if y<cols-1
            if Hystersis(x,y-1)==255||Hystersis(x+1,y-1)==255||Hystersis(x+1,y)==255||Hystersis(x+1,y+1)==255||Hystersis(x,y+1)==255
                curr=255;
            end
        end
    end
    if x>=2 && y==1 % check left coloumn
        if x<rows-1
            if Hystersis(x-1,y)==255||Hystersis(x+1,y)==255||Hystersis(x+1,y+1)==255||Hystersis(x,y+1)==255||Hystersis(x-1,y+1)==255
                curr=255;
            end
        end
    end
    if x>1 && y>1
        if x<=rows-1 && y<=cols-1
            if Hystersis(x-1,y)==255||Hystersis(x-1,y-1)==255||Hystersis(x,y-1)==255||Hystersis(x+1,y-1)==255||Hystersis(x+1,y)==255||Hystersis(x+1,y+1)==255||Hystersis(x,y+1)==255||Hystersis(x-1,y+1)==255
                curr=255;
            end
        end
    end
    if x==rows && y==1  
        if Hystersis(x-1,y)==255||Hystersis(x,y+1)==255||Hystersis(x-1,y+1)==255
            curr=255;
        end
    end
    if x==rows && y>1 
        if y<cols-1
            if Hystersis(x-1,y)==255||Hystersis(x-1,y-1)==255||Hystersis(x,y-1)==255||Hystersis(x,y+1)==255||Hystersis(x-1,y+1)==255
                curr=255;
            end
        end
    end
    if x>=2 && y==cols 
        if x<rows-1 
            if Hystersis(x-1,y)==255||Hystersis(x-1,y-1)==255||Hystersis(x,y-1)==255||Hystersis(x+1,y-1)==255||Hystersis(x+1,y)==255
                curr=255;
            end
        end
    end
    if x==rows && y==cols 
        if Hystersis(x-1,y)==255||Hystersis(x-1,y-1)==255||Hystersis(x,y-1)==255
            curr=255;
        end
    end
    output=curr;
end

