function [y1 y2]=Crossover(x1,x2)

    alpha=rand(size(x1));
    
    y1=abs(alpha.*x1+(1-alpha).*x2);
    y2=abs(alpha.*x2+(1-alpha).*x1);
    
   end