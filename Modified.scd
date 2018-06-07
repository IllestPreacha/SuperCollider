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
