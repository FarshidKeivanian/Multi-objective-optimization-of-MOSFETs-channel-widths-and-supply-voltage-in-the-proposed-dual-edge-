function z=Objectives(x)  %z=MOP2(x)

    n=numel(x);
    
    

z1=@(x) GAratio2(x)  

z2=@(x) GAWidth2(x); 


  CostFunction=@(x) GAratio2(x);  
  
  z1=@GAWidth2(x)
   1-exp(-sum((x-1/sqrt(n)).^2))
   %z1=1-exp(-sum((x-1/sqrt(n)).^2));
    
    z2=1-exp(-sum((x+1/sqrt(n)).^2));
    
    z=[z1 z2]';

end


