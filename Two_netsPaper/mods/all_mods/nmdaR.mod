TITLE simple NMDA receptors

COMMENT
This is modified from the original AMPAS receptor provided by Neuron. The only 
difference is the Mg2+ block as well as some parameter values.

Author: Fredrik Edin, 2003
Address: freedin@nada.kth.se

Original comment:
-----------------------------------------------------------------------------
	Simple model for glutamate AMPA receptors
	=========================================

  - FIRST-ORDER KINETICS, FIT TO WHOLE-CELL RECORDINGS

    Whole-cell recorded postsynaptic currents mediated by AMPA/Kainate
    receptors (Xiang et al., J. Neurophysiol. 71: 2552-2556, 1994) were used
    to estimate the parameters of the present model; the fit was performed
    using a simplex algorithm (see Destexhe et al., J. Computational Neurosci.
    1: 195-230, 1994).

  - SHORT PULSES OF TRANSMITTER (0.3 ms, 0.5 mM)

    The simplified model was obtained from a detailed synaptic model that 
    included the release of transmitter in adjacent terminals, its lateral 
    diffusion and uptake, and its binding on postsynaptic receptors (Destexhe
    and Sejnowski, 1995).  Short pulses of transmitter with first-order
    kinetics were found to be the best fast alternative to represent the more
    detailed models.

  - ANALYTIC EXPRESSION

    The first-order model can be solved analytically, leading to a very fast
    mechanism for simulating synapses, since no differential equation must be
    solved (see references below).


   Extension to model: A probability p of transmitter release. p is a function
   of the transmission delay, since, for a given normal delay, deviations will 
   decrease the probability of successful conductance along the axon.

 

References

   Destexhe, A., Mainen, Z.F. and Sejnowski, T.J.  An efficient method for
   computing synaptic conductances based on a kinetic model of receptor binding
   Neural Computation 6: 10-14, 1994.  

   Destexhe, A., Mainen, Z.F. and Sejnowski, T.J. Synthesis of models for
   excitable membranes, synaptic transmission and neuromodulation using a 
   common kinetic formalism, Journal of Computational Neuroscience 1: 
   195-230, 1994.

-----------------------------------------------------------------------------
ENDCOMMENT



NEURON {
	POINT_PROCESS nmdaR
	RANGE g, g_eff, s, synon, t1, t2
	RANGE Cdur, Alpha, Beta, Erev, Rinf, Rtau
	RANGE mag, eta, gamma
	NONSPECIFIC_CURRENT i
}
UNITS {
	(nA) = (nanoamp)
	(mV) = (millivolt)
	(mM) = (milli/liter)
	(uS) = (microsiemens)
}

PARAMETER {

	Cdur	= 4.0	(ms)		: transmitter duration (rising phase)
	Alpha	= 0.3	(/ms)		: forward (binding) rate
	Beta	= 0.01	(/ms)		: backward (unbinding) rate
	Erev	= 0	    (mV)		: reversal potential
	mag     = 1     (mM)
	eta	    = 3.57  (mM)
	gamma   = 0.062 (/mV)
	g       = 1e-5	(uS)		: base conductance
}


ASSIGNED {
	v		(mV)		: postsynaptic voltage
	i 		(nA)		: current = g*(v - Erev)
	g_eff 	(uS)		: conductance
	Rinf				: steady state channels open
	Rtau	(ms)		: time constant of channel binding
	synon
	t1
	t2
	s
}

STATE {Ron Roff}

INITIAL {
	Rinf = Alpha / (Alpha + Beta)
	Rtau = 1 / (Alpha + Beta)
	synon = 0
	t1 = 0
	t2 = 0
}

BREAKPOINT {
	SOLVE release METHOD cnexp
	s = Ron + Roff
	g_eff = g*s/(1 + mag * exp( - gamma * v ) / eta )
	i = g_eff * (v - Erev) 
}

DERIVATIVE release {
	Ron' = (synon*Rinf - Ron)/Rtau
	Roff' = -Beta*Roff
}

: following supports both saturation from single input and
: summation from multiple inputs
: if spike occurs during CDur then new off time is t + CDur
: ie. transmitter concatenates but does not summate
: Note: automatic initialization of all reference args to 0 except first

NET_RECEIVE(weight, on, nspike, r0, t0 (ms) ) {
	: flag is an implicit argument of NET_RECEIVE and  normally 0
        if (flag == 0) { : a spike, so turn on if not already in a Cdur pulse
		nspike = nspike + 1
		t1 = t1 + 1
		if (!on) {
			t2 = t2 + 1
			r0 = r0*exp(-Beta*(t - t0))
			t0 = t
			on = 1
			synon = synon + weight
			state_discontinuity(Ron, Ron + r0)
			state_discontinuity(Roff, Roff - r0)
		}
		: come again in Cdur with flag = current value of nspike
		net_send(Cdur, nspike)
        }
	if (flag == nspike) { : if this associated with last spike then turn off
		r0 = weight*Rinf + (r0 - weight*Rinf)*exp(-(t - t0)/Rtau)
		t0 = t
		synon = synon - weight
		state_discontinuity(Ron, Ron - r0)
		state_discontinuity(Roff, Roff + r0)
		on = 0
	}
}
