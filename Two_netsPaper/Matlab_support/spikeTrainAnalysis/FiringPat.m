%Computes the Firing histogram of the population by deviding the whole time of
%simulation in interval of size time_step and computes the number of spikes
%generated iwithin an interval n*timestep+/-timestep/2
%user have to pass the Cell structure containing the raster data of Spike 
%times of the population.
%Example (>>Raster=Raster1
%>>run 'full/path/FiringPat.m') 

total_time=40000;
time_step=6;%(ms)
N_elem=round(total_time/time_step);
time_vect=0+time_step/2:time_step:total_time; %-time_step;
a=zeros(1,N_elem);
if(size(time_vect)<N_elem)
    time_vect=floor(time_step/2):time_step:total_time+time_step;
elseif(size(time_vect)>N_elem)
    time_vect=floor(time_step/2):time_step:total_time-time_step;
end
time_vect=time_vect/1000;   %Expressing time units in seconds
for time=0:time_step:total_time-time_step  
    t_d=time-(time_step/2);     t_u=time+(time_step/2);     t_eval=time/time_step+1;
    for r=1:size(Raster,1)
        for count=1:size(Raster{r})
         if((t_d<Raster{r}(count))&&(Raster{r}(count)<=t_u))
            %fprintf('the value of count is %g\n', count)
            a(1,t_eval)=a(1,t_eval)+1;
            end
        end
    end
end
fprintf('The last read value of count was %g\n', count)