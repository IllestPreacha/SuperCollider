//Some Patterns for Supercollider

(
p = Pbind(
	\instrument, \nov07,
	\dur, Pseq([0.6, 0.15, 0.15], inf),
	\octave, Pseq([4,5,6], 87,90,110,inf),
	\midinote, Pseq([71, 115, [90,100,110],40,100,90,100], inf),
).play;
)



(
p = Pbind(
	\instrument, \nov08,
	\dur, Pseq([0.6, 0.15, 0.15], inf),
	\octave, Pseq([4,5,6], 87,90,110,inf),
	\midinote, Pseq([71,[100,90,107], 115, [90,100,110],40,100,90,100], inf),
).play;
)

(
p = Pbind(
	\instrument, \nov05,
	\dur, Pseq([0.6, 0.15, 0.15], inf),
	\freq, Pexprand(50, 400, inf),    //exponential distribution
	\dur, Pwhite(0.05, 0.5).trace ,
	\freq, Pwhite(0.05, 0.5).trace ,
	\octave, Pseq([4,5,6],inf),
	\midinote, Pseq([71, 115, [90,100,110],40,100,90,100], inf),
).play;
)

p.stop;

//Second Sequencer

(
p = Pbind(
	\instrument, Pseq([\Pulsating,\ChipOff],inf),
	\dur, Pwhite(0.05, 0.5).trace,  //linear distribution
	\freq, Pexprand(50, 400, inf),
).play;
)

p.stop;

x = Synth.new(\pulseTest, [\dur, Pseq([0.250, 3, 0.5,7, 0.1225, 7, 1/2, 1, 2, 2, 1.3], inf),\ampHz, 3.3, \fund, 40, \maxPartial, 4, \width, 0.15,\midinote, Pseq([110, [5,8,9,13,17], 60, [72, 71, 67],[72,19,100], 69, 11,71,[54,1, 7],22, [6,17, 59,], 67], inf),]);

