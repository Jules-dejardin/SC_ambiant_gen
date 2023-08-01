s.makeWindow;

(
~atkT = Array.fill(100, { rrand(0.01, 4) });
~relT = Array.fill(100, { rrand(0.5, 4) });
~slideBas = Array.fill(10, {rrand(3, 160)*3});
~slideHaut = Array.fill(10, {rrand(160, 250)*3});
~curve = Array.fill(100,{rrand(0.01,0.05)});
~step = Array.fill(100, {rrand(8,24).round(1)});
~pan = Array.fill(100, {rrand(0.01,0.1).round(0.01)});
~panMult = Array.fill(100, {rrand(0.1,0.5).round(0.1)});
)
// can be short but rarely
(
{
	var trigger, freqEnv, ampEnv;
	trigger = Impulse.kr(1/~step.choose);
	freqEnv = EnvGen.kr(Env.linen(~curve.choose, ~curve.choose, ~curve.choose, curve:4), gate: trigger).range(~slideBas.choose, ~slideHaut.choose);
	ampEnv = EnvGen.kr(Env.perc(~atkT.choose, ~relT.choose, 0.1), gate: trigger);
	Pan2.ar(SinOsc.ar(freq: freqEnv, mul: ampEnv), SinOsc.ar(~pan.choose, ~panMult.choose)) }.play;
)
// I use it for bass nap and short high
(
{
	var trigger, freqEnv, ampEnv;
	trigger = Impulse.kr(1/~step.choose);
	freqEnv = EnvGen.kr(Env.linen(0.1, 0.4, 0.2, curve:4), gate: trigger).range(120,140);
	ampEnv = EnvGen.kr(Env.perc(2, 2, 0.03), gate: trigger);
  Pan2.ar(SinOsc.ar(freq: freqEnv, mul: ampEnv), SinOsc.ar(~pan.choose, ~panMult.choose));
}.play;
)