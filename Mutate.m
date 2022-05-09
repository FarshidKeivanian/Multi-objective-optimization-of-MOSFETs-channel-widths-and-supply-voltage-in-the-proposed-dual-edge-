function y=Mutate(x,mu,sigma)

    nVar=numel(x);
    
    nMu=ceil(mu*nVar);

    j=randsample(nVar,nMu);
    
    y=abs(x);
            
    
    
         
   % y(j)=abs(x(j)+sigma*randn(size(j)));

      if abs(x(j)+sigma*randn(size(j))) < 1.6
        y(j) = 1.6;
    elseif abs(x(j)+sigma*randn(size(j))) > 2
        y(j)=2;
      else
          y(j)=x(j)+sigma*randn(size(j));
    end
    
    
end