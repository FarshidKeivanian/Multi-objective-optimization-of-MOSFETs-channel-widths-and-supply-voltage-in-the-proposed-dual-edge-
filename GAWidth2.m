% GAWidth1 stands for 3stage single-ended CMOS Ring Oscillator for Channel Widths    , 'b2.sp' ,    with


function ObjVal = GAWidth2(BestPosition)      
%% BestPositionrite into input .sp file
           
          
         fidIn=fopen('D:\Users\farshid\Documents\MATLAB\b2.sp','r+');
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
            !C:\synopsys\Hspice_A-2007.09\BIN\hspice.exe  -i D:\Users\farshid\Documents\MATLAB\b2.sp   -o D:\Users\farshid\Documents\MATLAB\b2
            
%% read data from .lis file 
           
           fidout=fopen('D:\Users\farshid\Documents\MATLAB\b2.lis','r+');
           B=fread(fidout);
           so = char(B');       
           
           pos=strfind(so,'avgpower');
           fseek(fidout,pos(2)+9,'bof');  % 2 ta kamtar az shorue Adad , va chon '  avgpower=  1.6017E-02  from=  1.0000E-09     to=  1.3000E-07'   hast ke 2 ta un taraftar shoru mishavad, pas az
           % jaee ke avg... shoru mishavad shomaresh mishavard kari be
           % blank nist
           ObjVal=fscanf(fidout,'%f') 
              
                   
           fclose('all'); 
           
end   
% End of function