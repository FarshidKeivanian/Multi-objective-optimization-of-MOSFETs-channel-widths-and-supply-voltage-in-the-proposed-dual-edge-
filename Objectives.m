function z=Objectives(x)  %z=MOP2(x)

  %% z1=1-exp(-sum((x-1/sqrt(n)).^2));
      % n=numel(x);
          
         fidIn=fopen('D:\Users\farshid\Documents\MATLAB\D.sp','r+');
         ach=fread(fidIn);
         pchar=char(ach');
          
        %% First position
          pos=strfind(pchar,'.pa')  %.param Vxx=1.572716 
      fseek(fidIn,pos(1)+10,'bof')
      fprintf(fidIn,'%5f',x(1))  % yeki ghablesh 
           
      
        %% Second position
      
      pos=strfind(pchar,'.pa');  % Neveshte ke yaft mishavad ra avale khar biavaram
         fseek(fidIn,pos(3)+10,'bof'); %.param W11=1.600000  % Bedune shomaresh "=" or ghabl az "=" 23 ta shod +ps=65u nrd=.4 nrs=.4 w=0.972991                                                                                                                   
           if x(2) < 1.5
           x(2) = 1.5;
    elseif x(2) > 2
        x(2)=2;
    end
         fprintf(fidIn,'%5f',abs(x(2)))               
        %% Third position
          pos=strfind(pchar,'.pa');
         fseek(fidIn,pos(4)+10,'bof'); %.param W22=1.600000    % Ta ghabl az "=" 25 ta shod +ps=80u nrd=.85 nrs=.85 w=  17                                                                                                                           
         if x(3) < 1.5
           x(3) = 1.5;
    elseif x(3) > 2
        x(3)=2;
    end
         fprintf(fidIn,'%5f',abs(x(3)));
      
      %%
                  
         fclose('all');
       
%% run hspice 
                !C:\synopsys\Hspice_A-2007.09\BIN\hspice.exe  -i D:\Users\farshid\Documents\MATLAB\D.sp   -o D:\Users\farshid\Documents\MATLAB\D
            
%% read data from .lis file 
           
           fidout=fopen('D:\Users\farshid\Documents\MATLAB\D.lis','r+');
           B=fread(fidout);
           so = char(B');       
           
           %% First Objective Function - Read it
           
          pos=strfind(so,'avgpower');  % 2 ta ghablesh
           fseek(fidout,pos(2)+9,'bof');
           
            % 2 ta kamtar az shorue Adad , va chon '  avgpower=  1.6017E-02  from=  1.0000E-09     to=  1.3000E-07'   hast ke 2 ta un taraftar shoru mishavad, pas az
           % jaee ke avg... shoru mishavad shomaresh mishavard kari be
           % blank nist
           z1=fscanf(fidout,'%f') 
        
           
           %% Second Objective Function - Read it
          %    pos=strfind(so,'risetime');
        %   fseek(fidout,pos(2)+9,'bof');  % 1. Shoru az khode kalameye risetime.  2. Az shoru ta 2ta ghabl az shorue addad shomaresh anjam mishavad :  risetime=  3.1008E-09  targ=  2.6804E-08   trig=  2.3703E-08
          % ObjVal1=fscanf(fidout,'%f') 
           %pos=strfind(so,'takhir');
           pos=strfind(so,'tpd');
           fseek(fidout,pos(2)+4,'bof');  % 1. Shoru az khode kalameye risetime.  2. Az shoru ta 2ta ghabl az shorue addad shomaresh anjam mishavad :  risetime=  3.1008E-09  targ=  2.6804E-08   trig=  2.3703E-08
           ObjVal1=fscanf(fidout,'%f');
           
           %
                 
          % pos=strfind(so,'falltime');
          % fseek(fidout,pos(2)+9,'bof');  % 1. Shoru az khode kalameye risetime.  2. Az shoru ta 2ta ghabl az shorue addad shomaresh anjam mishavad :   falltime=  2.7514E-09  targ=  1.3548E-08   trig=  1.0796E-08
         %  ObjVal2=fscanf(fidout,'%f') 
        %   fclose('all');
           
          % z2 = abs(1 - (ObjVal1/ObjVal2))
           z2 = abs (ObjVal1)
           z=[z1 z2]';

end


