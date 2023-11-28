clear relevant_peaks1 relevant_freqs1 pow_ampl peaks freq_ relevant_peaks relevant_freqs

%%          example:  var1=1;      poblacion lenta
%%          name_file=7; dominante

%%      este switch se define a partir del archivo analisis1.m que es en donde se
%%      maneja todo.
switch var1 %%pregunta si el raster es de la poblacion lenta (1-8) o rapida (9-16)
    case 1
        if (name_file<9&&studied_conduct<5)  flag_fft=0;%%==0 driving population ==>1 driven population        
        elseif (name_file>=9&&studied_conduct<5) flag_fft=1;
        end
        if (name_file<5&&studied_conduct==5)  flag_fft=0;clear freq pow_ampl peaks freq_ freq1_ peaks1 ref_freqs ref_power           
        elseif (name_file>=5&&studied_conduct==5) flag_fft=1;
        
        end
    case 2
        if (name_file>=9&&studied_conduct<5)  flag_fft=0;        
        elseif (name_file<9&&studied_conduct<5) flag_fft=1;
        end
        if (name_file>=5&&studied_conduct==5)  flag_fft=0; clear freq pow_ampl peaks freq_ freq1_ peaks1 ref_freqs ref_power
        elseif (name_file<5&&studied_conduct==5) flag_fft=1; 
        end
end

if(flag_fft==0||flag_fft==1)
freq=f;
pow_ampl=(spd.^0.5/80)';
i=2;
a=0;
while(i>1&&i<size(pow_ampl,2))%%initial filtering to find local maxima
    DP_inf=(pow_ampl(i)-pow_ampl(i-1))/(freq(i)-freq(i-1));
    DP_sup=(pow_ampl(i+1)-pow_ampl(i))/(freq(i+1)-freq(i));
    deriv2=(DP_sup-DP_inf)/(freq(i+1)-freq(i-1));    
    if((DP_inf>0&&DP_sup<0)&&deriv2<0&&freq(i)<=70)
        a=a+1;
        peaks(a)=pow_ampl(i);
        freq_(a)=freq(i);
    end
    i=i+1; 
end
[mx_power,mx_fr_idx]=max(peaks);%%the maximum power
mx_freq=freq_(mx_fr_idx);%%the frequency of the maximum power

        if( flag_fft==0)
            b=1;
            for ij=1:size(peaks,2)
                if(peaks(ij)>0.15*mx_power)
                   freq1_(b)=freq_(ij);
                   peaks1(b)=peaks(ij);
                   b=b+1;
                end
            end
            
            
            ref_freqs=freq1_;
            ref_power=peaks1;
        end
        
        if(flag_fft==1)
            i=1;a=0;
            while(i<size(peaks,2))
                if(peaks(i)>0.3*mx_power)                
                    a=a+1;
                    relevant_freqs(a)=freq_(i);
                    relevant_peaks(a)=peaks(i);
                end
                i=i+1;
            end
            
            
test_exist2=exist('relevant_freqs')
 if(test_exist2==1)
     
[mx_power1,mx_fr_idx1]=max(relevant_peaks);%%the maximum power
mx_freq1=relevant_freqs(mx_fr_idx1);%%the frequency of the maximum power
    i=2;a=1;
    while(i<size(relevant_peaks,2))
        DP_inf=(relevant_peaks(i)-relevant_peaks(i-1))/(relevant_freqs(i)-relevant_freqs(i-1));
        DP_sup=(relevant_peaks(i+1)-relevant_peaks(i))/(relevant_freqs(i+1)-relevant_freqs(i));
        deriv2=(DP_sup-DP_inf)/(relevant_freqs(i+1)-relevant_freqs(i-1));
        if((DP_inf>0&&DP_sup<0)&&deriv2<0)        
            relevant_peaks1(a)=relevant_peaks(i);
            relevant_freqs1(a)=relevant_freqs(i);
            a=a+1;
        end
        i=i+1;
    end
    test_exist1=exist('relevant_freqs1')
    if(test_exist1==1)
        slave_freqs=relevant_freqs1; slave_peaks=relevant_peaks1;
    else slave_freqs=relevant_freqs; slave_peaks=relevant_peaks;
    end
 else slave_freqs=0.0001; slave_peaks=0.0001;
 end
        
    end
    
    
         


end
    
%max_freq=
