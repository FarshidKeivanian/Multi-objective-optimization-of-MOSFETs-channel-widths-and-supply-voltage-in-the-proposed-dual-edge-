% GAtemp1 stands for 3stage single-ended CMOS Ring Oscillator for Rise/Fall Time Ratio in each inverter, 'b2.sp' ,    with
% GA

function ObjVal = GAratio2(BestPosition)      
%% BestPositionrite into input .sp file
           
          
         fidIn=fopen('D:\Users\Farshid\Documents\Matlab\b2.sp','r+');
         ach=fread(fidIn);
         pchar=char(ach');
                
          pos=strfind(pchar,'+ps');  % Neveshte ke yaft mishavad ra avale khar biavaram
         fseek(fidIn,pos(1)+22,'bof');   % Bedune shomaresh "=" or ghabl az "=" 23 ta shod +ps=65u nrd=.4 nrs=.4 w=0.972991                                                                                                                   
         fprintf(fidIn,'%5f',BestPosition(1));   
           
           
         pos=strfind(pchar,'+ps');
         fseek(fidIn,pos(2)+24,'bof'); % Ta ghabl az "=" 25 ta shod +ps=80u nrd=.85 nrs=.85 w=  17                                                                                                                           
         fprintf(fidIn,'%5f',BestPosition(2));      
           
              
         fclose('all');
       
%% run hspice 
            !C:\synopsys\Hspice_A-2007.09\BIN\hspice.exe  -i D:\Users\Farshid\Documents\Matlab\b2.sp   -o D:\Users\Farshid\Documents\Matlab\b2
            
%% read data from .lis file 
                  
           fidout=fopen('D:\Users\Farshid\Documents\Matlab\b2.lis','r+');
           
           B=fread(fidout);
           so = char(B');       
           pos=strfind(so,'risetime');
           fseek(fidout,pos(2)+9,'bof');  % 1. Shoru az khode kalameye risetime.  2. Az shoru ta 2ta ghabl az shorue addad shomaresh anjam mishavad :  risetime=  3.1008E-09  targ=  2.6804E-08   trig=  2.3703E-08
           ObjVal1=fscanf(fidout,'%f') 
           fclose('all'); 
           
           fidout=fopen('D:\Users\Farshid\Documents\Matlab\b2.lis','r+');
           B=fread(fidout);
           so = char(B');   
           
           pos=strfind(so,'falltime');
           fseek(fidout,pos(2)+9,'bof');  % 1. Shoru az khode kalameye risetime.  2. Az shoru ta 2ta ghabl az shorue addad shomaresh anjam mishavad :   falltime=  2.7514E-09  targ=  1.3548E-08   trig=  1.0796E-08
           ObjVal2=fscanf(fidout,'%f') 
           
           
           fclose('all'); 
           ObjVal = abs(1 - (ObjVal1/ObjVal2))
           
           
end   
% End of function