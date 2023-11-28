path(path,'../Matlab_support/spikeTrainAnalysis/');
run('.\output_matlab\g_eE_conn_ei2E_exp4_Ready.m');
figh=figure();
set(figh,'Position',[347 376  1333 538],'PaperPositionMode','auto','Visible','on')
I_E_frh2nwk
for var1=1:2
if(var1==1)
input1=b2;
idx_1=0;
var2=1;
elseif(var1==2)
input1=b4;
idx_1=2;
var2=3;
end
conv_analisis
fft_avella1_analisis
wavelet_avella2nwks_analisis
end