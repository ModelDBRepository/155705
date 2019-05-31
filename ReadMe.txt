Author: Oscar Javier Avella Gonzalez (oscarjavella at gmail.com)

Paper: Avella Gonzalez, O. J., Van Aerde, K. I., Mansvelder, H. D.,
Van Pelt, J., and Van Ooyen, A. (2014). Inter-network interactions:
impact of connections between oscillatory neuronal networks on
oscillation frequency and pattern. PloS ONE 9(7):e100899

The model was fully implemented in NEURON, with output files and
analysis tools in Matlab.
!!! Contains the MultipleRunControl, originally designed by R.A.J van
Elburg The software is released under the GNU GPL version 3:
http://www.gnu.org/copyleft/gpl.html

Purpose of this work:

The model was created to study the possible effects on the oscillatory
dynamics of a neuronal network (target network) when receiving
feed-forward synaptic input from a second oscillatory network (source
network). We simulated two non-harmonic oscillating networks, both
consisting of a population of excitatory (E) cells and a population of
inhibitory (I) cells. Both types of neurons are designed as single
compartments, each characterized by the type of synapse it projects
onto the postsynaptic cell, while membrane kinetics of both cell types
are the same. Thus, E cells project AMPA synapses, while I cells
project GABA_A synapses. The cells belonging to a certain network are
connected with specific probabilities, creating in each network a
pyramidal interneuron gamma-like oscillation (PING), whose oscillation
frequency depends on the decay time of the inhibitory channels.

The conductance factor C_f used to modify the strength of the
conductance of the main connections between the two networks was
varied as follows C_f=0, 0.01, 0.05, 0.5, 0.8, 1.5, 3.0, 7.0, 10.0,
15.0, 20.0.

For further details concerning the simulation and specific parameters,
please check the Methods section in the paper above.

Three types of outputs emerged from the model activity depending on
the strength of the "main" internetwork synapse, its type and number:

a) Locking of the activity of the target network to that of the source
network.
b) Transitions between episodes of high and low amplitude oscillations
(HAE/LAE).
c) Interspersed activity of two different rhythms.

Running the simulation:

The model was originally ran on NEURON 7.0 using the conventional
commands line scheme, edited in pspad, but any other text editor also
works.  To set up the simulation example, go to /main directory and
load the file

"Control_execute_network_bgk.hoc"

Once the windows are open, press the button "single run" in the
MultipleRuncontrol panel. The simulation will start, running for
40000ms. When the simulation stops, expand the window "Pyram Cells
Population # 1" in the horizontal axis between 16 and 18s.

Producing the example figure:

Open the /main menu and load, double clicking on the file
"runExampleFigs.m" Once Matlab has opened, press the button "run".

Remark:

The figure corresponds to the data in file
.\main\output_matlab\g_eE_conn_ei2E_exp4_Ready.m, with current files
set in the NEURON model.

The top panels represent the Fourier transform of the slow network
(source) and corresponding wavelet transform during the time of
simulation; and the bottom panels are the same for the fast network,
in this case the target network.  You can compare the
Example_figure.tif with the d. and e. panels in Fig. 9 of the paper.
Observe the resulting interspersed activity of the target network as a
direct consequence of the feed-forward connections projecting from the
excitatory (e) and inhibitory (i) cells of the slow network to the
excitatory (E) cells of the fast network, having e to E connection as
the relevant internetwork connection, where "e" and "i" stand for
excitatory/inhibitory cells of the slow network and "E" and "I" for
those of the fast network and Cf=0.8.


Manipulating the files:

You can change the Cf parameter by editing the
/main/functions_net_multipop.hoc file and determine which connections
between the networks must be on during the simulation.

-check lines 43 to 51   
{
geI_factor=1//multiplicative factors of the 
giI_factor=0//conductances used to connect 
geE_factor=0.8//intersecting cells of both networks
giE_factor=0//

gEi_factor=0
gIi_factor=0
gEe_factor=0
gIe_factor=0
}

and proceed as follows:

For the main connection, vary the g_(SourceTarget)_factor Cf with
Source/Target=i,e,I,E , i.e. each of the 64 possible combinations
using the values Cf=(0.01, 0.05, 0.5, 0.8, 1.5, 3.0, 7.0, 10.0, 15.0,
20.0)

For complementary connection, set the respective
"g_(source_target)_factor" to 0 if not included or 1 if included.

To change the name of the output .m file, open the file
\main\sessions\DrivePower_run_multi.ses and follow instructions of
lines 40-42.

Remarks:

To reproduce the dot figures of the paper, run the file
/Matlab_support/spikeTrainAnalysis/analisis1.m using the structure
filename g_(MainConnection)conn_(source)2(target)exp(number) ej:
g_eE_conn_ei2E_exp4, where number stands for the associated index in
the list below for the corresponding C_f factor= (0.01, 0.05, 0.5,
0.8, 1.5, 3.0, 7.0, 10.0, 15.0, 20.0).
