%%this file creates one histograms obtained from
%%analysis of Karlijn van Aerde's Data Feb3/10


mean_of_means=0;
mean_of_medians=0;
size_vect=-bin_stepx:bin_stepx:3;
A=cell(size(oscill_vect,1));
%figure()
for i=1:size(oscill_vect,1)
A{i}=hist(oscill_vect{i},size_vect);
size(A{i},2);
mean_dur_exp=mean(oscill_vect{i});%%computes mean duration per experiment
median_dur_exp=median(oscill_vect{i});%computes median duration per experiment
sem_exp=std(oscill_vect{i})/sqrt(size(oscill_vect{i},1));%%computes standard error per experiment
fprintf('exper.%g mean=%g, median=%g sem=%g \n',i,mean_dur_exp,median_dur_exp,sem_exp);
mean_of_means=mean_of_means+mean_dur_exp;%% add to get at the end the mean of means
mean_of_medians=mean_of_medians+median_dur_exp;%% add to get at the end the mean of medians
%plot(size_vect,A{i});
%hold on
end
mean_of_means=mean_of_means/size(oscill_vect,1);%% computes the mean from all the experiments means
mean_of_medians=mean_of_medians/size(oscill_vect,1);%% computes the mean from all the experiments medians
fprintf('mean of means = %g mean of medians = %g\n',mean_of_means,mean_of_medians);

mean_hist=zeros(1,size(size_vect,2));
for i=1:size(size_vect,2)
  for j=1:size(oscill_vect,1);  
  mean_hist(i)=mean_hist(i)+A{j}(i) ;
  end
  mean_hist(i)=round(mean_hist(i)/size(oscill_vect,1));
 end
 
 %%The next loop removes zeros from the original distribution and plots the
 %%resulting one
 m0=0;
for m=1:size(mean_hist,2)
if(mean_hist(m)>0)mean_hist1(m0+1)=mean_hist(m);
size_vect1(m0+1)=size_vect(m);
m0=m0+1;
end
end
 
 %plot(size_vect,mean_hist/sum(mean_hist),'r')%%plotting the normalized histogram
 
 
 
 
 
 
 %%========================================================================
 %% this part computes the mean duration the weighted mean duration
 w_mean=0;
 for i=1:size(mean_hist1,2)
 w_mean=w_mean+mean_hist1(i)*size_vect1(i)/sum(mean_hist1);
 end 
 
  
 %========================================================================
%%this loop computes the median of the average experimental distribution 
 clear k
k=zeros(1,sum(mean_hist1));
mm=0;n=0;
for(m=1:length(size_vect1))
mm=1;
while(mm<=mean_hist1(m))
n=n+1;
k(n)=size_vect1(m);
mm=mm+1;
end
end
w_median=median(k);
fprintf('mean of computed average distrib. = %g and median=%g\n',w_mean,w_median);
%======================================================================== 
 
 
 
 