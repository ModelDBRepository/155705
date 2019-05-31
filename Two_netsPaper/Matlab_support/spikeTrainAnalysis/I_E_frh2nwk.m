%this file only computes the firing rate histogram for each population


n_cel=zeros(1,3); %%number of cell in each population

for raster=4:-1:1
    if(raster==4)
        Raster=Raster_P1;
   elseif(raster==3)
        Raster=Raster_FS1;
    elseif(raster==2)
        Raster=Raster_P0; 
    elseif(raster==1)
        Raster=RasterFS0;       
                 
    end
    n_cel(1,raster)=size(Raster,1);
    FiringPat_A    %This line calls FiringPat

   if(raster==4)        a4=a; b4=c2; spk_t1=b/1000; %%E cells
   elseif(raster==3)    a3=a; b3=c2; spk_t1=b/1000; %%I cells
   elseif(raster==2)    a2=a; b2=c2; spk_t1=b/1000; %%E cell   
   elseif(raster==1)    a1=a; b1=c2; spk_t1=b/1000; %%I cells
   end   
   clear a c2
end 
 ta2=time_vect; ta1=ta2;
 clear time_vect