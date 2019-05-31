%file to comput the fourier spectrum of my signal 
%%using the pwelch function.
Fs=fs;
win_PSD=5*Fs;
noverlap_PSD=[];
nFFT=2.^10;
[spd,f]=pwelch(Outp,win_PSD,noverlap_PSD,nFFT,Fs); %spd=spectral power
                                                  %arbitrary units/Hz

subplot(2,2,var2)                                                 
axis([0 60 0 1])
%plot(f,spd.^0.5/norm_fact);   %we plot here the fourier amplitude
plot(f,spd.^0.5);              %to not over enphasyse the peaks.
set(gca,'FontSize',15,'XTick',[0,20,40,60,80],'ticklength',3.5*get(gca,'ticklength'),'TickDirMode','manual','TickDir','out')
xlabel('Frequency (Hz)')
if(var1==2)yl= ylabel('Spectral amplitude (Arbitrary Units/Hz)'); 
set(yl, 'Units', 'Normalized', 'Position', [-0.22, 1.3, 0]);
end;
ylim([0 50])
xlim([0 70])
box off;
grid off;