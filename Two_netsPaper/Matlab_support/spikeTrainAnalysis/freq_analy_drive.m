%%data for printing to file





%%===============================
%%===============================          
        relevant_freqs1=slave_freqs;
        relevant_peaks1=slave_peaks;
    
    
   %% Este pedacito verifica si la poblacion esclav tiene o no el ritmo
   %% dominante
   %%===============================
   %%===============================
   aa=0;
   power_ratio=zeros(1,1);
   locked_freq=zeros(1,1);
   for i1=1:size(ref_freqs,2)
       for i2=1:size(relevant_freqs1,2)
           if(relevant_freqs1(i2)>=ref_freqs(i1)-0.1&&relevant_freqs1(i2)<=ref_freqs(i1)+0.1&&relevant_peaks1(i2)<=ref_power(i1)) 
               aa=aa+1;
               power_ratio(aa)=relevant_peaks1(i2)/ref_power(i1);
               locked_freq(aa)=ref_freqs(i1);
               break
           end
       end
   end
   %%for var4=1:10
   switch var4
       case 11
           %%cdc_f(var4)=0.01;
           cdc_f(var4)=0;          
           figh1=figure(30); 
       case 1
           %%cdc_f(var4)=0.01;
           cdc_f(var4)=var4;                    
       case 2
           %%cdc_f(var4)=0.05;
           cdc_f(var4)=var4;
       case 3
           %%cdc_f(var4)=0.5;
           cdc_f(var4)=var4;
       case 4
           %%cdc_f(var4)=0.8;
           cdc_f(var4)=var4;
       case 5
           %%cdc_f(var4)=1.5;
           cdc_f(var4)=var4;
       case 6
           %%cdc_f(var4)=3;
           cdc_f(var4)=var4;
       case 7
           %%cdc_f(var4)=7;           
           cdc_f(var4)=var4;
       case 8
           %%cdc_f(var4)=10;
           cdc_f(var4)=var4;
       case 9
           %%cdc_f(var4)=15;
           cdc_f(var4)=var4;
       case 10
           %%cdc_f(var4)=16;
           cdc_f(var4)=var4;
   end
   
   cdc_f_V=cdc_f(var4)*ones(size(relevant_freqs1));
   cdc_f_V1=cdc_f(var4)*ones(size(ref_freqs));
   figure(30)
   for mk=1:size(relevant_freqs1,2)
       if(relevant_freqs1==0) plot(relevant_freqs1(mk),cdc_f_V(mk),'.','MarkerSize',20,'Color',[0.23 .56 0.89]);
       else plot(relevant_freqs1(mk),cdc_f_V(mk),'o','MarkerSize',13*relevant_peaks1(mk)/max(ref_power),'Color',[0.23 .56 0.89],'markerfacecolor',[0.23 .56 0.89]);
       end
       % %     plot3(relevant_freqs1(mk),cdc_f_V(mk),relevant_peaks1(mk),'o','MarkerSize',20*relevant_peaks1(mk),'Color',[0.23 .56 0.89]);
       % % stem3(relevant_freqs1,cdc_f_V,relevant_peaks1, '.b-')
       hold on
   end
       hold on
       %%scatter3(ref_freqs,cdc_f_V1,ref_power, '.r')
       % % plot3(ref_freqs,cdc_f_V1,ref_power, '.r')
       plot(ref_freqs,cdc_f_V1, '.r','MarkerSize',8)
       
xlim([0 70])
hold on
if(var4==11)   
    figure(30);
    
    %%camva(14);
    %%campos([ -36.5491   -0.8870    6.2677]);
    
    %%zlabel('Power (Arbit. Units)','FontSize',11.2);
    xlim([-2 70]); ylim([-1 11]); %% zlim([0 1.1]);    
    set(figh1,'Position',[347   601   700   720],'PaperPositionMode','auto','Visible','on');
    set(gca,'FontName','Arial','YTick',0:10,'YTickLabel','0|0.01|0.05|0.5|0.8|1.5|3.0|7.0|10.0|15.0|20.0|','FontSize',14)
    hold off; 
    grid on;
    ax1 = gca;
    xlabh = get(gca,'XLabel'); 
    set(xlabh,'Position',get(xlabh,'Position') - [ 0 0 0]);
    
    
    write_to_jpg1=sprintf('../../figures/ffts/%s%s_fft.jpg',s1,s2);
    set(0,'Units','pixels') 
    print('-djpeg', '-r300',write_to_jpg1)
    
    
    %%figura compilada de las 8 condiciones 
    if(name_file==1||name_file==9)%% abre figura de las compiladas
        figh2 = figure(31); 
        hold on;
    end
    
    set(figh2,'Position',[197 410 1644 641],'PaperPositionMode','auto','Visible','on')
    hold on
    s_idx=mod(name_file-1,8)+1;
    
    sp=subplot(2,4,s_idx); title(s3,'FontSize',16);
    figh2ax = get(ax1,'children');
    copyobj(figh2ax,sp);
    if(s_idx==1)set(gca,'FontName','Arial','TickDir','out','LineWidth',3,'TickLength',[0.035 0.035],'YTick',0:10,'YTickLabel'...
        ,'0|0.01|0.05|0.5|0.8|1.5|3.0|7.0|10.0|15.0|20.0|','XTickLabel',{''},'FontSize',15)
    if(studied_conduct==5)
        set(gca,'FontName','Arial','TickDir','out','LineWidth',3,'TickLength',[0.035 0.035],'YTick',0:10,'YTickLabel'...
        ,'0|2.25|3.75|7.50|11.25|15|18.75|37.50|45|67.50|90|','XTickLabel',{''},'FontSize',15)
        
    end
    end
    if(s_idx>1 && s_idx<5)
    set(gca,'FontName','Arial','TickDir','out','LineWidth',3,'TickLength',[0.035 0.035],'YTick',0:10,'YTickLabel',{''}...
        ,'XTickLabel',{''},'FontSize',15)    
    end
    
   
    if(s_idx==5)
    set(gca,'FontName','Arial','TickDir','out','LineWidth',3,'TickLength',[0.035 0.035],'YTick',0:10,'YTickLabel'...
        ,'0|0.01|0.05|0.5|0.8|1.5|3.0|7.0|10.0|15.0|20.0|','FontSize',15)
    if(studied_conduct==5)
        set(gca,'FontName','Arial','TickDir','out','LineWidth',3,'TickLength',[0.035 0.035],'YTick',0:10,'YTickLabel'...
        ,'0|2.25|3.75|7.50|11.25|15|18.75|37.50|45|67.50|90|','FontSize',15)        
    end
    end
    if(s_idx>5)
    set(gca,'FontName','Arial','TickDir','out','LineWidth',3,'TickLength',[0.035 0.035],'YTick',0:10,'YTickLabel',{''},'FontSize',15)
    end
    %%campos([35.0000 4.0000 0.9160 ]);
% %     camva(14);
% %     campos([ -36.5491   -0.8870    6.2677]);   
    xlim([-5 70]); ylim([-1 11]);  %zlim([0 1.1]); 
    if(s_idx==1) 
        ylabel('Conductance factor','FontSize',17);
        if(studied_conduct==5)
            ylabel('Connection percentage (%)','FontSize',17);
        end
    end
    if(s_idx==7) xlabel('Frequency (Hz)','FontSize',17); end
% %     grid on;
    
    
    
    
    
    close(figh1);
    
    if((name_file==8||name_file==16) && studied_conduct<5)%%cierra figuras compiladas
        write_to_jpg1=sprintf('../../figures/ffts_compiled/%s_fft_compiled.jpg',s1);
        write_to_fig=sprintf('../../figures/ffts_compiled/%s_fft_compiled.fig',s1);
        write_to_eps1=sprintf('../../figures/ffts_compiled/%s_fft_compiled.eps',s1);
        set(0,'Units','pixels') 
        print('-djpeg', '-r300',write_to_jpg1)
        print('-depsc2','-r300',write_to_eps1)
        saveas(figh2,write_to_fig)
        close(figh2)            
    end   
    
    if(name_file==8 && studied_conduct==5)%% condition: percentage of connections
        write_to_jpg1=sprintf('../../figures/connect_percent/con_perc_comp.jpg');
        write_to_fig=sprintf('../../figures/connect_percent/con_perc_comp.fig');
        write_to_eps1=sprintf('../../figures/connect_percent/con_perc_comp.eps');
        set(0,'Units','pixels') 
        print('-djpeg', '-r300',write_to_jpg1)
        print('-depsc2','-r300',write_to_eps1)
        saveas(figh2,write_to_fig)
        close(figh2)            
    end   
    
end
%%end






