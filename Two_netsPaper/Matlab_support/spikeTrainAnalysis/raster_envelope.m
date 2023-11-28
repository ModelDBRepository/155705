figure
if(idx_1==3)Raster=Raster_FS1; s='I cell index';end
if(idx_1==2)Raster=Raster_P1; s='E cell index';end
if(idx_1==1)Raster=RasterFS0; s='I cell index';end
if(idx_1==0)Raster=Raster_P0; s='E cell index';end
subplot(2,1,1);
for i=1:size(Raster,1)
for spike=1:size(Raster{i},1)
x=Raster{i}(spike);
%%plot([x,x+0.3]/1000,[i,i+1.1],'Color','k','LineWidth',0.2); %%here we plot the result against
plot([x,x]/1000,[i,i],'.','MarkerSize',4,'Color','k'); %%here we plot the result against
%%cell member by using little lines; time (sec)
end
set(gca,'FontSize',13);
ylabel(s,'FontSize',14);
xlim([16 18]); %horizontal range
ylim([-2 size(Raster,1)+5])% here we set the highest limit for the rasterplot
hold on;
end

%%Removing exploting splines components due to border conditions
%%=========================================================================
t=21;
clear tpl1 ttpl1
while(t<size(y_val,2))
tpl1(t-20)=y_val(t);
t=t+1;
end
tpl1=tpl1/1;%%max(tpl1);
ttpl1=21:size(y_val,2)-1;
ttpl1=tstep*ttpl1;


%%=========================================================================


spl_vect=tpl1/1;%%max(tpl1);%%max(in_v);           %%the spline interpolated vector
spl_vect1=abs(W(w_comp,:).^2/max(W(w_comp,:).^2));
spl_vect2=in_v/1;%%max(in_v);
%Y_lim=1.2*max(spl_vect2);
Y_lim=1.2*size(Raster,1);


subplot(2,1,2);
plot(ttpl1+.05,spl_vect,'r','LineWidth',2)%interpolated spline
%hold on
%plot(t_v1,spl_vect1,'LineWidth',2)%200th wavelet component (20Hz)
hold on
bar(t_v1+0.05,spl_vect2,'c')
set(gca,'FontSize',13);
%xlim([0 t_simul+0.1]); ylim([0 Y_lim]);
xlim([2 5]); ylim([0 Y_lim]);
ylabel('Firing Cells / 6ms','FontSize',14); 
xlabel('time (sec)','FontSize',14);