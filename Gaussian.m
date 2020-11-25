%% Gaussian Kernel Computation: 
% Pretty easy to implement... 
% Just use the formula for every 
% Return the output 
% Referred the slides for coding thsi
function [output,w] = Gaussian(sig_val)
    a=round((2*sig_val)-0.5);
    w=2*a+1;
    sum=0;
    output=[];
    for i=1:w
        temp=exp((-1*(i-1-a)*(i-1-a))/(2*sig_val*sig_val));
        sum=sum+temp;
        output=[output temp];
    end
    output=output/sum;   
end

