* Optimization of Dual Edge Triggered D Flip-Flop : Standard and Good Condition : Vxx=1.8  ,  W1= 0.05 , W2=0.4 , Len = 0.18
.option post


VDD 2 0 DC Vxx
.param Vxx=1.600000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
Vclock 1 0 pulse (v1 v2 td tr tf pw per)
Vdata 4 0 PWL 0 Vxx, 30n Vxx, 30.01n 0, 37.5n 0, 37.51n Vxx, 45.01n Vxx, 45.02n 0, 52.52n 0, 52.53n Vxx, 67.53n Vxx, 67.54n 0, 82.54n 0, 82.55n Vxx, 90.05n Vxx, 90.06n 0, 120.06n 0
.param v1=0 v2=Vxx  td=0.01ns   tr=0.01ns  tf=0.01ns  pw=4ns    per=8ns

*.Option Scale=1U
.param W11=1.879500                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
.param W22=0.658494                                                                                                                                                                                                                                                                               
.param W1='W11*1U'
.param W2='W22*1U'
.param Len=0.18U                                                                                                                                                                                                                                                                                                              
MN1 3 1 2 2 pch L=Len  W=W1 Pd=4U Ps=4U
MN2 3 1 0 0 nch L=Len W=W2 Pd=4U Ps=4U

MN3 4 1 5 5 pch L=Len W=W1 Pd=4U Ps=4U
MN4 5 3 4 4 nch L=Len W=W2 Pd=4U Ps=4U

MN5 4 3 6 6 pch L=Len W=W1 Pd=4U Ps=4U
MN6 6 1 4 4 nch L=Len W=W2 Pd=4U Ps=4U

MN7 8 2 5 5 nch L=Len W=W2 Pd=4U Ps=4U
MN8 7 2 6 6 nch L=Len W=W2 Pd=4U Ps=4U

MP1 9 5 2 2 pch L=Len W=W1 Pd=4U Ps=4U
MP2 9 5 0 0 nch L=Len W=W2 Pd=4U Ps=4U

MP3 8 6 2 2 pch L=Len W=W1 Pd=4U Ps=4U
MP4 8 6 0 0 nch L=Len W=W2 Pd=4U Ps=4U

MP5 8 9 2 2 pch L=Len W=W1 Pd=4U Ps=4U
MP6 8 9 0 0 nch L=Len W=W2 Pd=4U Ps=4U

MP7 7 8 2 2 pch L=Len W=W1 Pd=4U Ps=4U
MP8 7 8 0 0 nch L=Len W=W2 Pd=4U Ps=4U

MD1 9 3 10 10 nch L=Len W=W2 Pd=4U Ps=4U
MD2 8 1 10 10 nch L=Len W=W2 Pd=4U Ps=4U

MD3 11 10 2 2 pch L=Len W=W1 Pd=4U Ps=4U
MD4 11 10 0 0 nch L=Len W=W2 Pd=4U Ps=4U

MD5 2 11 12 12 pch L=Len W=W1 Pd=4U Ps=4U
MD6 12 11 0 0 nch L=Len W=W2 Pd=4U Ps=4U

MD7 13 12 2 2 pch L=Len W=W1 Pd=4U Ps=4U
MD8 13 12 0 0 nch L=Len W=W2 Pd=4U Ps=4U

CL 13 0 21fF


.model nch nmos LEVEL=49
+VERSION=3.22 Tnom=27.0
+ nch=1.024685E+17 tox=1.00000E-8 xj=1.00000E-07
+ lint=3.75860E-08 wint=-2.02101528644562E-07
+ vth0=.6094574 k1=.5341038 k2=1.703463E-03 k3=-17.24589
+ dvt0=.1767506 dvt1=.5109418 dvt2=-0.05
+ nlx=9.979638E-08 w0=1e-6
+ k3b=4.139039
+ vsat=97662.05 ua=-1.748481E-09 ub=3.178541E-18 uc=1.3623e-10
+ rdsw=298.873 u0=307.2991 prwb=-2.24e-4
+ a0=.4976366
+ keta=-2.195445E-02 a1=.0332883 a2=.9
+ voff=-9.623903E-02 nFactor=.8408191 cit=3.994609E-04
+ cdsc=1.130797E-04
+ cdscb=2.4e-5
+ eta0=.0145072 etab=-3.870303E-03
+ dsub=.4116711
+ pclm=1.813153 pdiblc1=2.003703E-02 pdiblc2=.00129051
+ pdiblcb=-1.034e-3
+ drout=.4380235 pscbe1=5.752058E+08 pscbe2=7.510319E-05
+ pvag=.6370527 prt=68.7 ngate=1.e20 alpha0=1.e-7 beta0=28.4
+ prwg=-0.001 ags=1.2
+ dvt0w=0.58 dvt1w=5.3e6 dvt2w=-0.0032
+ kt1=-.3 kt2=-.03
+ at=33000
+ ute=-1.5
+ ua1=4.31E-09 ub1=7.61E-18 uc1=-2.378e-10
+ kt1l=1e-8
+ wr=1 b0=1e-7 b1=1e-7 dwg=5e-8 dwb=2e-8 delta=0.015
+ cgdl=1e-10 cgsl=1e-10 cgbo=1e-10 xpart=0.0
+ cgdo=0.4e-9 cgso=0.4e-9
+ clc=0.1e-6
+ cle=0.6
+ ckappa=0.6


.model pch PMOS LEVEL=49
+VERSION=3.22 Tnom=27.0
+ nch=5.73068E+16 tox=1.00000E-8 xj=1.00000E-07
+ lint=8.195860E-08 wint=-1.821562E-07
+ vth0=-.86094574 k1=.341038 k2=2.703463E-02 k3=12.24589
+ dvt0=.767506 dvt1=.65109418 dvt2=-0.145
+ nlx=1.979638E-07 w0=1.1e-6
+ k3b=-2.4139039
+ vsat=60362.05 ua=1.348481E-09 ub=3.178541E-19 uc=1.1623e-10
+ rdsw=498.873 u0=137.2991 prwb=-1.2e-5
+ a0=.3276366
+ keta=-1.8195445E-02 a1=.0232883 a2=.9
+ voff=-6.623903E-02 nFactor=1.0408191 cit=4.994609E-04
+ cdsc=1.030797E-3
+ cdscb=2.84e-4
+ eta0=.0245072 etab=-1.570303E-03
+ dsub=.24116711
+ pclm=2.6813153 pdiblc1=4.003703E-02 pdiblc2=.00329051 
+ pdiblcb=-2.e-4
+ drout=.1380235 pscbe1=0 pscbe2=1.e-28
+ pvag=-.16370527
+ prwg=-0.001 ags=1.2
+ dvt0w=0.58 dvt1w=5.3e6 dvt2w=-0.0032
+ kt1=-.3 kt2=-.03 prt=76.4
+ at=33000
+ ute=-1.5
+ ua1=4.31E-09 ub1=7.61E-18 uc1=-2.378e-10
+ kt1l=0
+ wr=1 b0=1e-7 b1=1e-7 dwg=5e-8 dwb=2e-8 delta=0.015
+ cgdl=1e-10 cgsl=1e-10 cgbo=1e-10 xpart=0.0
+ cgdo=0.4e-9 cgso=0.4e-9
+ clc=0.1e-6
+ cle=0.6
+ ckappa=0.6


.TEMP  27
 .tran 0.1ps 120ns

 .meas tran tplh TRIG V(1) VAL='Vxx/2' RISE=6 TARG V(13) VAL='Vxx' RISE=7
 .meas tran tphl TRIG V(1) VAL='Vxx/2' FALL=11 TARG V(13) VAL='0' FALL=12

 .meas tran tpd param='(abs(tphl)+abs(tplh))/2'

 .meas tran avgpower avg power from = 0ps  to = 120ns
.END