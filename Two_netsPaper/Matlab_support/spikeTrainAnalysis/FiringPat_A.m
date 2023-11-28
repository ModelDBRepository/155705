clear a b b1

total_time=4e4;%(ms)              %=========
time_step=6;%(ms)                   %========= Constants Definition
N_elem=round(total_time/time_step); %=========
t_simul=total_time/1000;            %========= Simulated period in seconds
a=zeros(1,N_elem);



%Collapsing the whole cell object of spikes
ii=0;
for r=1:size(Raster,1)
    for count=1:size(Raster{r})ii=ii+1; b(ii)=Raster{r}(count);end
end

%%b=b/1000; %%conversion factor to set the units in seconds
[c2,time_vect]=hist(b,N_elem); %%extract the histogram and time vectors
a=c2;