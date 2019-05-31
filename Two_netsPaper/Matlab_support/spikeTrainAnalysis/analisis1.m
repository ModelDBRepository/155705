%%This file plots the fft and wavelet for the activity in the E population
%%of both networks.



for studied_conduct=5:1:5%%3:1:3
    if(studied_conduct<=4)numb_cases=16;
    elseif(studied_conduct==5)numb_cases=8;
    end
    for name_file=1:1:numb_cases%%1:1:1
    
    if(studied_conduct==1)
        if(name_file<9)s1='g_eE_conn_';
        else s1='gEe_conn_';end        
        switch name_file
            case 0
                s1='Networks_REF_';
                s2='FREE';
            case 1
                s2='e2E_exp';
                s3='geE e2E';
            case 2
                s2='e2E_i2I_exp';
                s3='geE e2E-i2I';
            case 3
                s2='e2EI_exp';
                s3='geE e2EI';
            case 4
                s2='e2Eei2I_exp';
                s3='geE e2E-ei2I';            
            case 5
                s2='ei2E_exp';
                s3='geE ei2E';
            case 6
                s2='ei2E_i2I_exp';
                s3='geE ei2E-i2I';
            case 7
                s2='ei2Ee2I_exp';
                s3='geE ei2E-e2I';
            case 8
                s2='ei2EI_exp';
                s3='geE ei2EI';                
            case 9
                s2='E2e_exp';
                s3='gEe E2e';
            case 10
                s2='E2e_I2i_exp';
                s3='gEe E2e-I2i';            
            case 11
                s2='E2ei_exp';
                s3='gEe E2ei';
            case 12
                s2='E2eEI2i_exp';
                s3='gEe E2e-EI2i';
            case 13
                s2='EI2e_exp';
                s3='gEe EI2e';
            case 14
                s2='EI2e_I2i_exp';
                s3='gEe EI2e-I2i';
            case 15
                s2='EI2eE2i_exp';
                s3='gEe EI2e-E2i';
            case 16
                s2='EI2ei_exp'; 
                s3='gEe EI2ei';         
        end
    end

%%the segment above corresponds to eE and Ee connections table
    if(studied_conduct==2)
        if(name_file<9)s1='g_iI_conn_';
        else s1='gIi_conn_';end       
        switch name_file            
            case 1
                s2='i2I_exp';
                s3='giI i2I';
            case 2
                s2='e2E_i2I_exp';
                s3='giI e2E-i2I';
            case 3
                s2='ei2I_exp';
                s3='giI ei2I'; 
            case 4
                s2='i2EI_exp';
                s3='giI i2EI';
            case 5
                s2='i2E_ei2I_exp';
                s3='giI i2E-ei2I';                        
            case 6
                s2='e2E_ei2I_exp';
                s3='giI e2E-ei2I';                              
            case 7
                s2='ei2E_i2I_exp';
                s3='giI ei2E-i2I'; 
            case 8
                s2='ei2EI_exp';
                s3='giI ei2EI';                
            case 9
                s2='I2i_exp';
                s3='gIi I2i';
            case 10
                s2='E2e_I2i_exp';
                s3='gIi E2e-I2i';
            case 11
                s2='EI2i_exp';
                s3='gIi EI2i';
            case 12
                s2='I2ei_exp';
                s3='gIi I2ei';
            case 13
                s2='I2e_EI2i_exp';
                s3='gIi I2e-EI2i';           
            case 14
                s2='E2e_EI2i_exp';
                s3='gIi E2e-EI2i';
            case 15
                s2='EI2e_I2i_exp';
                s3='gIi EI2e-I2i';
            case 16
                s2='EI2ei_exp';
                s3='gIi EI2ei';            
        end
    end
    
    %% the segment above corresponds to iI and Ii connections table
    
    if(studied_conduct==3)
        if(name_file<9)s1='g_eI_conn_';
        else s1='gEi_conn_';end  
        
        switch name_file
            case 1 
                s2='eI_exp';
                s3='geI e2I';
            case 2
                s2='e2EI_exp';
                s3='geI e2EI';
            case 3
                s2='e2E_ei2I_exp';
                s3='geI e2E-ei2I';            
            case 4 
                s2='ei2E_e2I_exp';
                s3='geI ei2E-e2I';            
            case 5 
                s2='ei2I_exp';
                s3='geI ei2I';            
            case 6 
                s2='i2E_e2I_exp';
                s3='geI i2E-e2I';
            case 7 
                s2='i2E_ei2I_exp';
                s3='geI i2E-ei2I';
            case 8 
                s2='ei2EI_exp';
                s3='geI ei2EI'; 
            case 9
                s2='Ei_exp';
                s3='gEi E2i';
            case 10
                s2='E2ei_exp';
                s3='gEi E2ei';           
            case 11            
                s2='E2e_EI2i_exp';
                s3='gEi E2e-EI2i';            
            case 12
                s2='EI2e_E2i_exp';
                s3='gEi EI2e-E2i';           
            case 13
                s2='EI2i_exp';
                s3='gEi EI2i';            
            case 14
                s2='I2e_E2i_exp';
                s3='gEi I2e-E2i';
            case 15
                s2='I2e_EI2i_exp';
                s3='gEi I2e-EI2i';
            case 16
                s2='EI2ei_exp';
                s3='gEi EI2ei';
        end
    end
    
    
    if(studied_conduct==4)
        if(name_file<9)s1='g_iE_conn_';
        else s1='gIe_conn_';end  
        switch name_file
            case 1
                s2='i2E_exp';
                s3='giE i2E ';
            case 2
                s2='i2EI_exp';
                s3='giE i2EI';            
            case 3
                s2='i2E_ei2I_exp';
                s3='giE i2E-ei2I';             
            case 4 
                s2='i2E_e2I_exp';
                s3='giE i2E-e2I';
            case 5 
                s2='ei2E_exp';
                s3='giE ei2E';           
            case 6 
                s2='ei2E_i2I_exp';
                s3='giE ei2E-i2I';      
            case 7 
                s2='ei2E_e2I_exp';
                s3='giE ei2E-e2I';
            case 8 
                s2='ei2EI_exp';
                s3='giE ei2EI';
            case 9
                s2='I2e_exp';
                s3='gIe I2e';
            case 10
                s2='I2ei_exp';
                s3='gIe I2ei';            
            case 11
                s2='I2e_EI2i_exp';
                s3='gIe I2e-EI2i';      
            case 12
                s2='I2e_E2i_exp';
                s3='gIe I2e-E2i';
            case 13
                s2='EI2e_exp';
                s3='gIe EI2e';   
            case 14
                s2='EI2e_I2i_exp';
                s3='gIe EI2e-I2i';               
            case 15
                s2='EI2e_E2i_exp';
                s3='gIe EI2e-E2i';
            case 16
                s2='EI2ei_exp';
                s3='gIe EI2ei';
        end
    end
    
    
    if(studied_conduct==5)        
        switch name_file
            case 1 
                s1='g_eE_conn_ei2E_e2I';
                s2='_exp7_perc_';
                s3='geE ei2E-e2I exp7 ';
            case 2
                s1='g_iI_i2I';
                s2='_exp7_perc_';
                s3='giI-i2I exp7';
            case 3
                s1='g_eI_e2EI';
                s2='_exp7_perc_';
                s3='geI e2EI exp7';
            case 4 
                s1='g_iE_ei2E_i2I';
                s2='_exp5_perc_';
                s3='giE ei2E-i2I exp5'; 
            case 5
                s1='gEe_E2e';
                s2='_exp7_perc_';
                s3='gEe-E2e exp7';                        
            case 6                 
                s1='gIi_I2i';
                s2='_exp7_perc_';
                s3='gIi I2i exp7';                       
            case 7
                s1='gEi_EI2i';
                s2='_exp5_perc_';
                s3='gEi EI2i exp5';           
            case 8 
                s1='gIe_EI2ei';
                s2='_exp4_perc_';
                s3='gIe EI2ei';            
        end
    end 
    
    
    
    % % % %
    % %  %% the segment above corresponds to iI and Ii connections table   
    
   
    for var4=1:1:11%%4:1:4
        if(var4<11) lea_a = sprintf('./%s%s%g.m',s1,s2,var4)
        end
        if(var4==11) lea_a = sprintf('./Networks_REF_FREE1.m')
        end
       
        run(lea_a);
        I_E_frh2nwk
        figh=figure();        
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
            frequ_anlysis
            wavelet_avella2nwks_analisis
        end
        write_to_eps=sprintf('../../figures/ntwks2011/%s%s%g.eps',s1,s2,var4);
        write_to_jpg=sprintf('../../figures/ntwks2011a/%s%s%g.jpg',s1,s2,var4);
        write_to_figA=sprintf('../../figures/ntwks2011a/%s%s%g.fig',s1,s2,var4);
        set(0,'Units','pixels') 
        set(figh,'Position',[347   601   700   313],'PaperPositionMode','auto','Visible','off')
        %print('-depsc2','-r300',write_to_eps)
        print('-djpeg', '-r300',write_to_jpg)
        %%saveas(figh,write_to_figA)
        close hidden
        freq_analy_drive
    
    end
    %%clear
    end
end
