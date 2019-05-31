% script to write a wavelet from my 
% convoluted alpha function network activity

f_low=0.01;  % lowest frequency
f_high=70;  % highest frequency
f_step=0.1; % frequency step
[W,t,fq]=Wavelet_1ch(Outp,fs,f_low,f_high,f_step);
subplot(2,2,var2+1)
imagesc(t,fq,flipud(abs(W)));
colormap(jet(64))
axis xy;
set(gca,'FontSize',15,'XTick',[16,16.5,17,17.5,18],'YTick',[0,10,20,30,40,50],'ticklength',3.5*get(gca,'ticklength'),'TickDirMode','manual','TickDir','out')
cb=colorbar();
set(cb,'FontSize',10);
xlim([16 18]); %horizontal range
ylim([0 50]);% here we set the highest limit for the power
xlabel('time (s)')
ylabel('Frequency (Hz)')
caxis([0 100]) % change colorbar limits
box off;
in_v=input1;