%Author: OSCAR jAVIER AVELLA GONZALEZ
% convolution of a column external vector with an alpha function   
% modified and adapted from Poil en van-Elburg's file

t_simul=4e4;      % total simulated time in milliseconds (NEURONs units)


n=5;                % exponent's multiplicative factor
                    % to define the window size (NOTHING TO DO WITH the 
                    %discretization step)

alpha=0.15;          % alpha factor to multiply the exponent of 
                     % the exponential and to determine the size 
                     % of the temporal window

w_size=floor(n/alpha); % takes the closest integer 
                       % to the argument toward -infty 

fs=1000/time_step;   %%166.67;% sampling frequency Hz                  
                       
                       
tau=1000/fs;            % temporal  window resolution 
                        % tau=1/f_sampling (fs) [tau]=>ms 
                        % that is the reason for the 
                        % 1000 factor

                       
tmax=t_simul/tau;          % (ms), the same as the NEURON tstop 
aa=0;                % elements counter of the spikes-vector a


%input1=input('Please, supply the input vector\n');     % input data
%idx_1=input('and index population 0 or 2 for E pops and 1 or 3 for I pops vector\n');

if (idx_1==0) norm_fact=n_cel(1,2);
elseif (idx_1==1)norm_fact=n_cel(1,1);
elseif (idx_1==2)norm_fact=n_cel(1,4);
elseif (idx_1==3)norm_fact=n_cel(1,3);
end




        
                       
tau_vect = 0:tau:w_size;        
omega = alpha.*alpha.*tau_vect.*exp(-alpha.*tau_vect);% "achtung"
                                                      % here we are
                                                      % creating a new
                                                      % complete "vector"
    
omega = (1/max(omega)).*omega; % normalized omega which is actually
                               % the alpha function in the whole 
                               % interval, with the required time
                               % resolution.

                               
Outp =zeros(1,(size(input1,2))+floor(w_size/tau)); % vector to SAVE the
                                         % convoluted data
                                         
size(input1,2) 
 for i=1:size(input1,2)  % this cycle
    if(i+w_size<size(input1,2))
Outp(i:(i+floor(w_size/tau)))=Outp(i:(i+floor(w_size/tau)))+input1(i)*omega;  % performs the
     end
     end

%%Outp=input1;
%Additional computation to determine the desynchronuization threshold for
%the waning period
 
%ISI vector for the E population without 0 spike elements
clear k
kc=0;
for(i=1:size(a1,2))
if(a1(i)>0)
kc=kc+1;
k(kc)=a1(i);
end
end                                                                             % convolution
mk=median(k);
%%fprintf('Detection threshold E cells = %g\n',mk )

%ISI vector for the I population without 0 spike elements
clear k1
kc=0;
for(i=1:size(a2,2))
if(a2(i)>0)
kc=kc+1;
k1(kc)=a2(i);
end
end  

mk1=median(k1);
%%fprintf('Detection threshold I cells = %g\n',mk1)
                       