%% Gaussian_Deriv:
% Formula Based : Taking in the sigma_value and giving out a list of
% derived value and updated w value
% Reference taken from the slides
function [output,w] = Gaussian_Deriv(Sigma)
    a=round((2*Sigma)-0.5);
    w=2*a+1;
    sum=0;
    output=[];
    for i=1:w
        G1=-1*(i-1-a)*exp((-1*(i-1-a)*(i-1-a))/(2*Sigma*Sigma));
        sum=sum-(i*G1);
        output=[output G1];
    end
    output=output/sum;  % Equalizing since the area under PDF is 1
    output=flip(output); 
end