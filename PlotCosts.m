function PlotCosts(pop)

    Costs=[pop.Cost];
    
    plot(Costs(1,:),Costs(2,:),'r*','MarkerSize',10);
    xlabel('1st Objective Function : Total Average Power');
    ylabel('2nd Objective Function : Propagation Delay Time');
    grid on;

end