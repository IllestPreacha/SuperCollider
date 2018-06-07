//Two different synths that I have got from other code repos and did some slight modifications

(
SynthDef.new(\Pulsating, {
	arg ampHz= Prand([3.70,2.50,7],inf), fund=40, maxPartial=4, width=2.5, sustain= Prand([3.70,2.50,7],inf);
	var amp1, amp2,amp3, freq1, freq2, sig1, sig2;
	amp1 = Clip.kr(ampHz, 0, 0.12) * 0.75;
	amp2 = LFPulse.kr(ampHz, 0.5, 0.12) * 0.75;
	amp3 = amp1 + amp2;
	freq1 = LFNoise0.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq2 = LFNoise1.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq1 = freq1 * Blip.kr(8, add:1);
	freq2 = freq2 * LFPulse.kr(6, add:1);
	sig1 = Pulse.ar(freq1, width, amp1);
	sig2 = Saw.ar(freq2, width, amp2);
	sig1 = FSinOsc.ar(sig1, 0.2, 0.7, 0.8, 0.9,0.75, 0.25,0.2);
	sig2 = FreeVerb.ar(sig2, 0.7, 0.8,0.5, 0.25,0.75,0.75,0.115);
	Out.ar(0, sig1);
	Out.ar(1, sig2);
}).add;
)

//Chip like music can be made it seems

(
SynthDef.new(\ChipOff, {
	arg freq=Prand([370,250,770,1440],inf), atk=Prand([3.70,2.50,7],inf), rel=0.3, amp=1, pan=0;
	var sig,sig2,amp1, env;
	amp1 = Clip.kr(atk, 0, 0.12) * 0.75;
	sig = SinOsc.ar(freq);
	amp1 = sig + amp1;
	sig2 = Pulse.ar(freq * 2.1);
	env = EnvGen.kr(Env.new([0,1,0], [atk, rel], [1, -1]), doneAction:2);
	sig = Pan2.ar(sig + sig2, pan, amp);
	sig = sig * env;
	Out.ar(0, sig);
}).add;
)

//Two Remixes of D0kt0r0 Nov05

SynthDef(\nov08,{
    arg freq=440,freq2 = 660, amp=0.1,sustain=1.0,out=0,lpf=1000, attack=1.5;
    var audio,env;
	freq = Clip.kr(freq,10,3000);
	freq2 = Wrap.kr(freq,10,3000);
    sustain = Clip.kr(sustain,0.201,1000);
	attack = Pulse.kr(attack,5,100,200); 
    audio = Pulse.ar(freq:freq,mul:amp);
    audio = Wrap.ar(audio,freq:lpf);
    env = Env.new([0,1,0],[sustain/2,sustain/2]);
    audio = audio * EnvGen.ar(env,doneAction:2);
    Out.ar(out,audio);
}).add;

SynthDef(\nov07,{
    arg freq=440,freq2 = 660, amp=0.1,sustain=1.0,out=0,lpf=1000, attack=1.5;
    var audio,env,freq3;
	freq = Clip.kr(freq,10,3000);
	freq2 = Wrap.kr(freq,10,3000);
	freq3 = freq + freq2;
    sustain = Clip.kr(sustain,0.201,1000);
	attack = Pulse.kr(attack,5,100,200); 
    audio = Saw.ar(audio,freq:lpf/2);
    env = Env.new([0,1,0],[sustain/2,sustain/2]);
    audio = audio * EnvGen.ar(env,doneAction:2);
    Out.ar(out,audio);
}).add;

//Twisting the Kick Sound with higher Midi Notes and extra frequencies

SynthDef(\kickTwist,
	{
		arg freq = 670,freq2 = 100, out = 0, amp = 4.1, sustain = 0.101;
		var audio,audio2,freq3;
		freq2;
		audio = SinOsc.ar(freq, mul: amp);
		audio = audio * EnvGen.ar(Env.perc(0.001,sustain-0.001), doneAction: 2);
		audio2 = Pulse.ar(freq2, mul:amp);
		audio2 = audio2 * EnvGen.ar(Env.perc(0.02,sustain-0.02), doneAction: 2);
		freq3 = freq - freq2;
		Out.ar(out,audio);
}).add;

(
p = Pbind(
	\instrument, \kickTwist,
	\dur, Pseq([0.6, 0.15, 0.15], inf),
	\octave, Pseq([4,5,6], 87,90,110,inf)+Penv([24,19,80],inf),
	\midinote, Pseq([42, 83, [32,86,35],30,40,34,120], inf),
	\db, 5
).play;
)
