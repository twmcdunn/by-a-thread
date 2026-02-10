(
p = ProxySpace.push(s);
fork{
	s.boot;
	s.waitForBoot{
		s.options.memSize = 8192 * 32;
		s.options.numWireBufs = 128;
		s.sync;
		s.reboot;
		s.waitForBoot {
			var buffs, names, playThenLoop, pbfb, lp;

			//p = ProxySpace.new;

			//p.fadeTime = 2;

			s.sync;

			d = ();

			d[\live] = true;

			if(d[\live]){
				d[\numRecChannels] = 3;//3 for live
			}
			{
				d[\numRecChannels] = 2;//3 for live
			};

			d.amp = 1;

			buffs = ();
			names = ["piano.wav",
				"gradual_unveiling.wav",
				"loop.wav",
				"chord1/loopable0.wav",
				"chord1/loopable1.wav",
				"chord1/loopable2.wav",
				"chord1/loopable3.wav",
				"chord1/loopable4.wav",
				"chord1/loopable5.wav",
				"chord1/many_octaves0.wav",
				"chord1/many_octaves1.wav",
				"chord1/many_octaves2.wav",
				"chord1/many_octaves3.wav",
				"chord1/many_octaves4.wav",
				"chord1/many_octaves5.wav",
				"chord1/many_octaves6.wav",
				"chord1/many_octaves7.wav",
				"chord1/many_octaves8.wav",
				"chord1/many_octaves9.wav",
				"chord1/many_octaves10.wav",
				"chord1/many_octaves11.wav",
				"chord1/many_octaves12.wav",
				"chord1/many_octaves13.wav",
				"chord1/many_octaves14.wav",
				"chord1/many_octaves15.wav",
				"chord1/many_octaves16.wav",
				"chord1/many_octaves17.wav",
				"chord1/many_octaves18.wav",
				"chord1/many_octaves19.wav",
				"chord1/many_octaves20.wav",
				"chord1/many_octaves21.wav",
				"chord1/many_octaves22.wav",
				"chord1/many_octaves23.wav",
				"chord1/many_octaves24.wav",
				"chord1/many_octaves25.wav",
				"chord1/many_octaves26.wav",
				"chord1/many_octaves27.wav",
				"chord1/many_octaves28.wav",
				"chord1/many_octaves29.wav",
				"chord2/many_octaves0.wav",
				"chord2/many_octaves1.wav",
				"chord2/many_octaves2.wav",
				"chord2/many_octaves3.wav",
				"chord2/many_octaves4.wav",
				"chord2/many_octaves5.wav",
				"chord2/many_octaves6.wav",
				"chord2/many_octaves7.wav",
				"chord2/many_octaves8.wav",
				"chord2/many_octaves9.wav",
				"chord2/many_octaves10.wav",
				"chord2/many_octaves11.wav",
				"chord2/many_octaves12.wav",
				"chord2/many_octaves13.wav",
				"chord2/many_octaves14.wav",
				"chord2/many_octaves15.wav",
				"chord2/many_octaves16.wav",
				"chord2/many_octaves17.wav",
				"chord2/many_octaves18.wav",
				"chord2/many_octaves19.wav",
				"chord2/many_octaves20.wav",
				"chord2/many_octaves21.wav",
				"chord2/many_octaves22.wav",
				"chord2/many_octaves23.wav",
				"chord3/many_octaves0.wav",
				"chord3/many_octaves1.wav",
				"chord3/many_octaves2.wav",
				"chord3/many_octaves3.wav",
				"chord3/many_octaves4.wav",
				"chord3/many_octaves5.wav",
				"chord3/many_octaves6.wav",
				"chord3/many_octaves7.wav",
				"chord3/many_octaves8.wav",
				"chord3/many_octaves9.wav",
				"chord3/many_octaves10.wav",
				"chord3/many_octaves11.wav",
				"chord3/many_octaves12.wav",
				"chord3/many_octaves13.wav",
				"chord3/many_octaves14.wav",
				"chord3/many_octaves15.wav",
				"chord3/many_octaves16.wav",
				"chord3/many_octaves17.wav",
				"chord3/many_octaves18.wav",
				"chord3/many_octaves19.wav",
				"chord3/many_octaves20.wav",
				"chord3/many_octaves21.wav",
				"chord3/many_octaves22.wav",
				"chord3/many_octaves23.wav",
				"chord4/many_octaves0.wav",
				"chord4/many_octaves1.wav",
				"chord4/many_octaves2.wav",
				"chord4/many_octaves3.wav",
				"chord4/many_octaves4.wav",
				"chord4/many_octaves5.wav",
				"chord4/many_octaves6.wav",
				"chord4/many_octaves7.wav",
				"chord4/many_octaves8.wav",
				"chord4/many_octaves9.wav",
				"chord4/many_octaves10.wav",
				"chord4/many_octaves11.wav",
				"chord4/many_octaves12.wav",
				"chord4/many_octaves13.wav",
				"chord4/many_octaves14.wav",
				"chord4/many_octaves15.wav",
				"chord4/many_octaves16.wav",
				"chord4/many_octaves17.wav",
				"chord4/many_octaves18.wav",
				"chord4/many_octaves19.wav",
				"chord4/many_octaves20.wav",
				"chord4/many_octaves21.wav",
				"chord4/many_octaves22.wav",
				"chord4/many_octaves23.wav",
				"chord1-2_mix.wav",
				"chord2/chord.wav",
				"chord3-4_mix.wav",
				"chord4-4b_mix.wav",
				"chord4b-4c_mix.wav",
				"chord4c-4_mix.wav",
				"chord3/chord.wav",
				"chord4/chord.wav",
				"chord4/cresc2.wav",
				"chord5/loopable0.wav",
				"chord5/loopable1.wav",
				"chord5/loopable2.wav",
				"chord5/loopable3.wav",
				"chord5/loopable4.wav",
				"chord5/loopable5.wav",
				"chord6/loopable0.wav",
				"chord6/loopable1.wav",
				"chord6/loopable2.wav",
				"chord6/loopable3.wav",
				"chord6/loopable4.wav",
				"chord6/loopable5.wav",
				"chord7/loopable0.wav",
				"chord7/loopable1.wav",
				"chord7/loopable2.wav",
				"chord7/loopable3.wav",
				"chord7/loopable4.wav",
				"chord7/loopable5.wav",
				"chord3/basicLoop.wav",
				"chord1/basicLoop.wav",
				"chord5/many_octaves0.wav",
				"chord5/many_octaves1.wav",
				"chord5/many_octaves2.wav",
				"chord5/many_octaves3.wav",
				"chord5/many_octaves4.wav",
				"chord5/many_octaves5.wav",
				"chord5/many_octaves6.wav",
				"chord5/many_octaves7.wav",
				"chord5/many_octaves8.wav",
				"chord5/many_octaves9.wav",
				"chord5/many_octaves10.wav",
				"chord5/many_octaves11.wav",
				"chord5/many_octaves12.wav",
				"chord5/many_octaves13.wav",
				"chord5/many_octaves14.wav",
				"chord5/many_octaves15.wav",
				"chord5/many_octaves16.wav",
				"chord5/many_octaves17.wav",
				"chord5/many_octaves18.wav",
				"chord5/many_octaves19.wav",
				"chord5/many_octaves20.wav",
				"chord5/many_octaves21.wav",
				"chord5/many_octaves22.wav",
				"chord5/many_octaves23.wav",
				"chord6/many_octaves0.wav",
				"chord6/many_octaves1.wav",
				"chord6/many_octaves2.wav",
				"chord6/many_octaves3.wav",
				"chord6/many_octaves4.wav",
				"chord6/many_octaves5.wav",
				"chord6/many_octaves6.wav",
				"chord6/many_octaves7.wav",
				"chord6/many_octaves8.wav",
				"chord6/many_octaves9.wav",
				"chord6/many_octaves10.wav",
				"chord6/many_octaves11.wav",
				"chord6/many_octaves12.wav",
				"chord6/many_octaves13.wav",
				"chord6/many_octaves14.wav",
				"chord6/many_octaves15.wav",
				"chord6/many_octaves16.wav",
				"chord6/many_octaves17.wav",
				"chord6/many_octaves18.wav",
				"chord6/many_octaves19.wav",
				"chord6/many_octaves20.wav",
				"chord6/many_octaves21.wav",
				"chord6/many_octaves22.wav",
				"chord6/many_octaves23.wav",
				"chord7/many_octaves0.wav",
				"chord7/many_octaves1.wav",
				"chord7/many_octaves2.wav",
				"chord7/many_octaves3.wav",
				"chord7/many_octaves4.wav",
				"chord7/many_octaves5.wav",
				"chord7/many_octaves6.wav",
				"chord7/many_octaves7.wav",
				"chord7/many_octaves8.wav",
				"chord7/many_octaves9.wav",
				"chord7/many_octaves10.wav",
				"chord7/many_octaves11.wav",
				"chord7/many_octaves12.wav",
				"chord7/many_octaves13.wav",
				"chord7/many_octaves14.wav",
				"chord7/many_octaves15.wav",
				"chord7/many_octaves16.wav",
				"chord7/many_octaves17.wav",
				"chord7/many_octaves18.wav",
				"chord7/many_octaves19.wav",
				"chord7/many_octaves20.wav",
				"chord7/many_octaves21.wav",
				"chord7/many_octaves22.wav",
				"chord7/many_octaves23.wav",
				"chord8/many_octaves0.wav",
				"chord8/many_octaves1.wav",
				"chord8/many_octaves10.wav",
				"chord8/many_octaves11.wav",
				"chord8/many_octaves12.wav",
				"chord8/many_octaves13.wav",
				"chord8/many_octaves14.wav",
				"chord8/many_octaves15.wav",
				"chord8/many_octaves16.wav",
				"chord8/many_octaves17.wav",
				"chord8/many_octaves18.wav",
				"chord8/many_octaves19.wav",
				"chord8/many_octaves2.wav",
				"chord8/many_octaves20.wav",
				"chord8/many_octaves21.wav",
				"chord8/many_octaves22.wav",
				"chord8/many_octaves23.wav",
				"chord8/many_octaves3.wav",
				"chord8/many_octaves4.wav",
				"chord8/many_octaves5.wav",
				"chord8/many_octaves6.wav",
				"chord8/many_octaves7.wav",
				"chord8/many_octaves8.wav",
				"chord8/many_octaves9.wav",
				"chord9/many_octaves0.wav",
				"chord9/many_octaves1.wav",
				"chord9/many_octaves10.wav",
				"chord9/many_octaves11.wav",
				"chord9/many_octaves12.wav",
				"chord9/many_octaves13.wav",
				"chord9/many_octaves14.wav",
				"chord9/many_octaves15.wav",
				"chord9/many_octaves16.wav",
				"chord9/many_octaves17.wav",
				"chord9/many_octaves18.wav",
				"chord9/many_octaves19.wav",
				"chord9/many_octaves2.wav",
				"chord9/many_octaves20.wav",
				"chord9/many_octaves21.wav",
				"chord9/many_octaves22.wav",
				"chord9/many_octaves23.wav",
				"chord9/many_octaves3.wav",
				"chord9/many_octaves4.wav",
				"chord9/many_octaves5.wav",
				"chord9/many_octaves6.wav",
				"chord9/many_octaves7.wav",
				"chord9/many_octaves8.wav",
				"chord9/many_octaves9.wav",
				"chord10/many_octaves0.wav",
				"chord10/many_octaves1.wav",
				"chord10/many_octaves10.wav",
				"chord10/many_octaves11.wav",
				"chord10/many_octaves12.wav",
				"chord10/many_octaves13.wav",
				"chord10/many_octaves14.wav",
				"chord10/many_octaves15.wav",
				"chord10/many_octaves16.wav",
				"chord10/many_octaves17.wav",
				"chord10/many_octaves18.wav",
				"chord10/many_octaves19.wav",
				"chord10/many_octaves2.wav",
				"chord10/many_octaves20.wav",
				"chord10/many_octaves21.wav",
				"chord10/many_octaves22.wav",
				"chord10/many_octaves23.wav",
				"chord10/many_octaves3.wav",
				"chord10/many_octaves4.wav",
				"chord10/many_octaves5.wav",
				"chord10/many_octaves6.wav",
				"chord10/many_octaves7.wav",
				"chord10/many_octaves8.wav",
				"chord10/many_octaves9.wav",
				"chord11/many_octaves0.wav",
				"chord11/many_octaves1.wav",
				"chord11/many_octaves10.wav",
				"chord11/many_octaves11.wav",
				"chord11/many_octaves12.wav",
				"chord11/many_octaves13.wav",
				"chord11/many_octaves14.wav",
				"chord11/many_octaves15.wav",
				"chord11/many_octaves16.wav",
				"chord11/many_octaves17.wav",
				"chord11/many_octaves18.wav",
				"chord11/many_octaves19.wav",
				"chord11/many_octaves2.wav",
				"chord11/many_octaves20.wav",
				"chord11/many_octaves21.wav",
				"chord11/many_octaves22.wav",
				"chord11/many_octaves23.wav",
				"chord11/many_octaves3.wav",
				"chord11/many_octaves4.wav",
				"chord11/many_octaves5.wav",
				"chord11/many_octaves6.wav",
				"chord11/many_octaves7.wav",
				"chord11/many_octaves8.wav",
				"chord11/many_octaves9.wav",
				"chord12/many_octaves0.wav",
				"chord12/many_octaves1.wav",
				"chord12/many_octaves10.wav",
				"chord12/many_octaves11.wav",
				"chord12/many_octaves12.wav",
				"chord12/many_octaves13.wav",
				"chord12/many_octaves14.wav",
				"chord12/many_octaves15.wav",
				"chord12/many_octaves16.wav",
				"chord12/many_octaves17.wav",
				"chord12/many_octaves18.wav",
				"chord12/many_octaves19.wav",
				"chord12/many_octaves2.wav",
				"chord12/many_octaves20.wav",
				"chord12/many_octaves21.wav",
				"chord12/many_octaves22.wav",
				"chord12/many_octaves23.wav",
				"chord12/many_octaves24.wav",
				"chord12/many_octaves25.wav",
				"chord12/many_octaves26.wav",
				"chord12/many_octaves27.wav",
				"chord12/many_octaves3.wav",
				"chord12/many_octaves4.wav",
				"chord12/many_octaves5.wav",
				"chord12/many_octaves6.wav",
				"chord12/many_octaves7.wav",
				"chord12/many_octaves8.wav",
				"chord12/many_octaves9.wav",
				"amSpec_a1.wav",
				"amSpec_a2.wav",
				"amSpec_a3.wav",
				"amSpec_a4.wav",
				"amSpec_a5.wav",
				"amSpec_a6.wav",
				"amSpec_a7.wav",
				"amSpec_a11.wav",
				"amSpec_a13.wav",
				"amSpec_b1.wav",
				"amSpec_b2.wav",
				"amSpec_b3.wav",
				"amSpec_b5.wav",
				"amSpec_b7.wav",
				"amSpec_b11.wav",
				"amSpec_b13.wav",
				"chord5-6_mix.wav",
				"chord6-7_mix.wav",
				"amSpec_eb1.wav",
				"amSpec_eb2.wav",
				"amSpec_eb3.wav",
				"amSpec_eb5.wav",
				"amSpec_eb7.wav",
				"amSpec_eb11.wav",
				"amSpec_eb13.wav",
				"chord6/reverse.wav",
				"chord8-9_morph.wav",
				"chord9-10_morph.wav",
				"chord10-11_morph.wav",
				"chord11-12_morph.wav",
				"hbctext/hbc1_0.wav",
				"hbctext/hbc1_1.wav",
				"hbctext/hbc1_2.wav",
				"hbctext/hbc1_3.wav",
				"hbctext/hbc1_4.wav",
				"hbctext/hbc1_5.wav",
				"hbctext/hbc2_0.wav",
				"hbctext/hbc2_1.wav",
				"hbctext/hbc2_2.wav",
				"hbctext/hbc2_3.wav",
				"hbctext/hbc2_4.wav",
				"hbctext/hbc2_5.wav",
				"hbctext/hbc3_0.wav",
				"hbctext/hbc3_1.wav",
				"hbctext/hbc3_2.wav",
				"hbctext/hbc3_3.wav",
				"hbctext/hbc3_4.wav",
				"hbctext/hbc3_5.wav",
				"hbctext/hbc4_0.wav",
				"hbctext/hbc4_1.wav",
				"hbctext/hbc4_2.wav",
				"hbctext/hbc4_3.wav",
				"hbctext/hbc4_4.wav",
				"hbctext/hbc4_5.wav",
				"chord13/many_octaves0.wav",
				"chord13/many_octaves1.wav",
				"chord13/many_octaves10.wav",
				"chord13/many_octaves11.wav",
				"chord13/many_octaves12.wav",
				"chord13/many_octaves13.wav",
				"chord13/many_octaves14.wav",
				"chord13/many_octaves15.wav",
				"chord13/many_octaves16.wav",
				"chord13/many_octaves17.wav",
				"chord13/many_octaves18.wav",
				"chord13/many_octaves19.wav",
				"chord13/many_octaves2.wav",
				"chord13/many_octaves20.wav",
				"chord13/many_octaves21.wav",
				"chord13/many_octaves22.wav",
				"chord13/many_octaves23.wav",
				"chord13/many_octaves3.wav",
				"chord13/many_octaves4.wav",
				"chord13/many_octaves5.wav",
				"chord13/many_octaves6.wav",
				"chord13/many_octaves7.wav",
				"chord13/many_octaves8.wav",
				"chord13/many_octaves9.wav",
				"chord14/many_octaves0.wav",
				"chord14/many_octaves1.wav",
				"chord14/many_octaves10.wav",
				"chord14/many_octaves11.wav",
				"chord14/many_octaves12.wav",
				"chord14/many_octaves13.wav",
				"chord14/many_octaves14.wav",
				"chord14/many_octaves15.wav",
				"chord14/many_octaves16.wav",
				"chord14/many_octaves17.wav",
				"chord14/many_octaves18.wav",
				"chord14/many_octaves19.wav",
				"chord14/many_octaves2.wav",
				"chord14/many_octaves20.wav",
				"chord14/many_octaves21.wav",
				"chord14/many_octaves22.wav",
				"chord14/many_octaves23.wav",
				"chord14/many_octaves3.wav",
				"chord14/many_octaves4.wav",
				"chord14/many_octaves5.wav",
				"chord14/many_octaves6.wav",
				"chord14/many_octaves7.wav",
				"chord14/many_octaves8.wav",
				"chord14/many_octaves9.wav",
				"chord15/many_octaves0.wav",
				"chord15/many_octaves1.wav",
				"chord15/many_octaves10.wav",
				"chord15/many_octaves11.wav",
				"chord15/many_octaves12.wav",
				"chord15/many_octaves13.wav",
				"chord15/many_octaves14.wav",
				"chord15/many_octaves15.wav",
				"chord15/many_octaves16.wav",
				"chord15/many_octaves17.wav",
				"chord15/many_octaves18.wav",
				"chord15/many_octaves19.wav",
				"chord15/many_octaves2.wav",
				"chord15/many_octaves20.wav",
				"chord15/many_octaves21.wav",
				"chord15/many_octaves22.wav",
				"chord15/many_octaves23.wav",
				"chord15/many_octaves3.wav",
				"chord15/many_octaves4.wav",
				"chord15/many_octaves5.wav",
				"chord15/many_octaves6.wav",
				"chord15/many_octaves7.wav",
				"chord15/many_octaves8.wav",
				"chord15/many_octaves9.wav",
				"chord16/many_octaves0.wav",
				"chord16/many_octaves1.wav",
				"chord16/many_octaves10.wav",
				"chord16/many_octaves11.wav",
				"chord16/many_octaves12.wav",
				"chord16/many_octaves13.wav",
				"chord16/many_octaves14.wav",
				"chord16/many_octaves15.wav",
				"chord16/many_octaves16.wav",
				"chord16/many_octaves17.wav",
				"chord16/many_octaves18.wav",
				"chord16/many_octaves19.wav",
				"chord16/many_octaves2.wav",
				"chord16/many_octaves20.wav",
				"chord16/many_octaves21.wav",
				"chord16/many_octaves22.wav",
				"chord16/many_octaves23.wav",
				"chord16/many_octaves3.wav",
				"chord16/many_octaves4.wav",
				"chord16/many_octaves5.wav",
				"chord16/many_octaves6.wav",
				"chord16/many_octaves7.wav",
				"chord16/many_octaves8.wav",
				"chord16/many_octaves9.wav",
				"chord5/reverse.wav",
				"hbc1Drone.wav",
				"hbc2Drone.wav",
				"hbc3Drone.wav",
				"hbc4Drone.wav",
				"bellPianoChord.wav",
				"Handbells/100.wav",
				"Handbells/101.wav",
				"Handbells/102.wav",
				"Handbells/103.wav",
				"Handbells/104.wav",
				"Handbells/105.wav",
				"Handbells/106.wav",
				"Handbells/107.wav",
				"Handbells/108.wav",
				"Handbells/36.wav",
				"Handbells/37.wav",
				"Handbells/38.wav",
				"Handbells/39.wav",
				"Handbells/40.wav",
				"Handbells/41.wav",
				"Handbells/42.wav",
				"Handbells/43.wav",
				"Handbells/44.wav",
				"Handbells/45.wav",
				"Handbells/46.wav",
				"Handbells/47.wav",
				"Handbells/48.wav",
				"Handbells/49.wav",
				"Handbells/50.wav",
				"Handbells/51.wav",
				"Handbells/52.wav",
				"Handbells/53.wav",
				"Handbells/54.wav",
				"Handbells/55.wav",
				"Handbells/56.wav",
				"Handbells/57.wav",
				"Handbells/58.wav",
				"Handbells/59.wav",
				"Handbells/60.wav",
				"Handbells/61.wav",
				"Handbells/62.wav",
				"Handbells/63.wav",
				"Handbells/64.wav",
				"Handbells/65.wav",
				"Handbells/66.wav",
				"Handbells/67.wav",
				"Handbells/68.wav",
				"Handbells/69.wav",
				"Handbells/70.wav",
				"Handbells/71.wav",
				"Handbells/72.wav",
				"Handbells/73.wav",
				"Handbells/74.wav",
				"Handbells/75.wav",
				"Handbells/76.wav",
				"Handbells/77.wav",
				"Handbells/78.wav",
				"Handbells/79.wav",
				"Handbells/80.wav",
				"Handbells/81.wav",
				"Handbells/82.wav",
				"Handbells/83.wav",
				"Handbells/84.wav",
				"Handbells/85.wav",
				"Handbells/86.wav",
				"Handbells/87.wav",
				"Handbells/88.wav",
				"Handbells/89.wav",
				"Handbells/90.wav",
				"Handbells/91.wav",
				"Handbells/92.wav",
				"Handbells/93.wav",
				"Handbells/94.wav",
				"Handbells/95.wav",
				"Handbells/96.wav",
				"Handbells/97.wav",
				"Handbells/98.wav",
				"Handbells/99.wav",
				"morphLoop.wav",
				"drammaticCrash.wav",
				"hbTrills.wav",
				"trM1.wav",
				"trM2.wav",
				"trM3.wav",
				"gradual_veiling_clustered3.wav",
				"hbcDroneLoop.wav",
				"drammaticCrashWithBuild1.wav"
			];

			names.do({arg n;
				buffs.add(n[0..n.size-5].asSymbol -> Buffer.read(s, Document.current.dir ++ "/resources/" ++ n));
			});

			s.sync;

			d.playThenLoop = {
				|idx = 0|
				{
					var buf1, buf2, gate, amp = 0.5, arr;

					buf1 = PlayBuf.ar(2, buffs[idx], BufRateScale.kr(buffs[idx]));
					gate = 1 - Trig.kr(1, buffs[idx].duration - 0.1);//Mix.ar(Latch.kr(Done.kr(buf1), Done.kr(buf1)));
					buf2 =  PlayBuf.ar(2,buffs[idx+1], BufRateScale.kr(buffs[idx+1]), gate, loop: 1);


					SelectX.ar(gate.lag(0.1), [buf1,buf2]).madd(amp);
				};
			};

			d.fadePlayer = { |trig = 0, buf1, buf2, fadeTime = 3|
				var phase1, phase2, sig1, sig2, env, switch, timer, crossfade, crossfadeEnv;

				// Envelope that fades in/out based on trigger
				env = EnvGen.kr(
					Env.asr(0, 1, fadeTime),
					gate: trig
				);

				/*// Timer starts when trigger goes positive, outputs time in seconds
				timer = Sweep.kr(trig, 1);

				// Switch from buffer 1 to buffer 2 at 135 seconds
				switch = timer > 135;*/

				// Crossfade coefficient (0 = buf1, 1 = buf2)
				crossfadeEnv = EnvGen.kr(
					Env([0, 0, 1], [135, fadeTime]),
					gate: trig
				);

				crossfade = Select.kr(\cf.kr(0) > 0.5, [crossfadeEnv, 1]);

				sig1 = PlayBuf.ar(2, buf1, BufRateScale.kr(buf1), trig);
				sig2 = PlayBuf.ar(2, buf2, BufRateScale.kr(buf2), trig, loop: 1);
				sig2 = LPF.ar(sig2, 3520, 2);//?

				// Crossfade between buffers and apply envelope
				((sig1 * (1 - crossfade)) + (sig2 * crossfade)) * env;
			};

			d.transition = {
				|buff|
				var trig = \trig.tr(0);
				PlayBuf.ar(2, buff, BufRateScale.kr(buff), trig);
			};

			s.sync;

			lp = {
				|buffLen = 10|
				{
					|sig|
					var local, decay;
					//sig = Mix.ar(sig);
					decay = 1;//0.99;
					local = LocalIn.ar(2);

					local = DelayC.ar(local, buffLen, buffLen);

					//add effects
					//local = FreeVerb.ar(local);

					local = local + sig;
					LocalOut.ar(local * decay);

					local;//.dup;
				}
			};
			pbfb = {//ptichbend feedback
				|rat = (-0.5.midiratio), pbfbdec = 0.5, bufLen = 1|
				\filter -> {
					|sig|
					//, ratio = (-0.5.midiratio)|
					// var ratio = (-0.5.midiratio);
					var local;
					var sinktime = 1, mod1, mod2, mod3;
					var delay1, delay2;
					var maxDelay = 1.0;
					var delSig1, delSig2;
					var filtSig;
					var ratio;
					var isAsc;

					isAsc = rat.floor;// = 1 if ascending 0 if descending

					//decay = 0.5;
					//decay = 1;
					//pbfbdec = pbfbdec.lag(5);

					local = LocalIn.ar(2);

					local = DelayC.ar(local, bufLen, bufLen);
					/*local = Convolution2.ar(local, d.data.buffs["hbLoop1".asSymbol]).madd(0.01);*/

					//PITCH SHIFT
					//ratio = ratio.lag(5);

					ratio = Select.kr(isAsc, [1 - rat, rat - 1]);//so it can be interepreted as a pitch ratio

					// Your modulators
					mod1 = LFSaw.kr(1 / sinktime, 1).range(isAsc, 1 - isAsc);
					mod2 = LFSaw.kr(1 / sinktime, 0).range(isAsc, 1 - isAsc);
					mod3 = SinOsc.ar(1 / sinktime, pi / 2.0).range(0,1);//.range(-0.1, 1.1).clip(0, 1);

					// Smooth the delay time modulation
					delay1 = 0.001 + (ratio * mod1);//Lag.kr(0.1 + (fallAmount * mod1), 0.01);
					delay2 = 0.001 + (ratio * mod2);//Lag.kr(0.1 + (fallAmount * mod2), 0.01);

					// Build two comb filters manually
					delSig1 = DelayC.ar(
						local.madd(1 - mod3),
						maxDelay,
						delay1
					).madd(1 - mod3);

					delSig2 = DelayC.ar(
						local.madd(mod3),
						maxDelay,
						delay2
					).madd(mod3);

					filtSig = Mix.ar([delSig1, delSig2]) * 1.75;

					filtSig = CombL.ar(filtSig, 0.2, 0.2);

					local = Mix.ar([filtSig,local]);


					local = local + LPF.ar(sig,15000);//sig;//

					local = LeakDC.ar(local);
					LocalOut.ar(local * pbfbdec);

					(local * 0.9) + (sig * 0.1);
				}
			};

			d.filtFuncs = ();
			d.filtFuncs.pbfb = pbfb;

			d.data = (
				buffs: buffs
			);

			d.filters = (
				fallingDel: \filter -> {
					|sig, sinktime = 3, fallAmount = 0.1, decay = 0.35|
					var mod1, mod2, mod3;
					var delay1, delay2, fb, comb1, comb2;
					var maxDelay = 1.0;
					var postDecayTime = 5;

					fallAmount = fallAmount.lag(5);

					// Your modulators
					mod1 = LFSaw.kr(1 / sinktime, 1).range(0, 1);
					mod2 = LFSaw.kr(1 / sinktime, 0).range(0, 1);
					mod3 = SinOsc.ar(1 / sinktime, pi / 2.0).range(0,1);//.range(-0.1, 1.1).clip(0, 1);

					// Smooth the delay time modulation
					delay1 = 0.001 + (fallAmount * mod1);//Lag.kr(0.1 + (fallAmount * mod1), 0.01);
					delay2 = 0.001 + (fallAmount * mod2);//Lag.kr(0.1 + (fallAmount * mod2), 0.01);

					// Get feedback (2 channels for 2 comb filters)
					fb = LocalIn.ar(1);

					// Build two comb filters manually
					comb1 = DelayC.ar(
						sig.madd(1 - mod3) + (fb), // input + feedback
						maxDelay,
						delay1
					);//.madd(1 - mod3);

					comb2 = DelayC.ar(
						sig.madd(mod3) + (fb), // input + feedback
						maxDelay,
						delay2
					);//.madd(mod3);

					// Write feedback back
					LocalOut.ar([comb1 * decay, comb2 * decay]);
					//add back the dry sig
					comb1 = Mix.ar([comb1, sig.madd(1-mod3)]);
					comb2 = Mix.ar([comb1, sig.madd(mod3)]);
					// Mix output
					sig = Mix.ar([comb1, comb2]);
					sig = CombC.ar(sig, 0.2, 0.2, postDecayTime);
					sig;
				},
				autoPan: \filter -> {
					|sig|
					var rate = 1 / (5.0 + Latch.kr(WhiteNoise.kr(), Impulse.kr(0)).range(0,1));
					var rand = Latch.kr(WhiteNoise.kr(), Impulse.kr(0)).range(0,2pi);
					var mod = SinOsc.kr(rate, rand);
					sig = Mix.ar(sig).range(-0.25, 0.25);
					sig = Pan2.ar(sig, mod);
					sig;
				},
				harmonicSeries: \filter -> {
					|sig|
					var freq, hasFreq, in, isSilent,bwr = 1, peak;
					sig = Mix.ar(sig);

					# freq, hasFreq = Pitch.kr(sig, peakThreshold: 0.5);
					peak = PeakFollower.ar(in: 0.0, decay: 0.999);
					isSilent = DetectSilence.ar(sig,peak * 0.9);

					freq = Latch.kr(freq, hasFreq * (1-isSilent));

					freq = freq.lag(0.05);

					in = sig;
					5.do{
						sig = Mix.ar(Array.fill(5, {arg n; Resonz.ar(in: in, freq: freq * (n+1), bwr: bwr)}));
						in = sig.madd(0.3);
					};
					sig.dup;
				},
				loopFilterLong: \filter -> lp.(20),
				loopFilterShort: \filter -> lp.(5),
				pbfb: pbfb.value(-0.5.midiratio, 0.3),
				pbfb1: pbfb.value(-5.midiratio,
					0.6,//0.7, //local feedback in 0.1 sec loop
					0.1),
				pbfb2: pbfb.value(-5.midiratio,
					0.7,//0.9, //local feedback in 0.5 sec loop
					0.5),
				pbfb3: pbfb.value(-5.midiratio,
					0.5,//0.7, //local feedback in 0.1 sec loop
					0.1),
				pbfb4: pbfb.value(5.midiratio, 0.6, 0.1),
				hold: \filter -> {
					|sig|
					var local, feedback;

					feedback = SinOsc.kr(1/3.0).range(0.5,0.9);

					local = LocalIn.ar(2)+sig;
					10.do{local = AllpassN.ar(local, 0.2, 0.1.rand + 0.05, 1)};

					local = LeakDC.ar(local);

					LocalOut.ar(local*feedback);

					sig+local;
				};
			);

			SynthDef.new(\playBufWithAutoPan, {
				arg buff = 0, out = 0, trig = 1, amp = 1, rateRatio = 1;
				var sig,mod;
				FreeSelf.kr(1 - trig * 2);
				sig = PlayBuf.ar(2, buff, BufRateScale.kr(buff) * rateRatio, doneAction: Done.freeSelf);
				sig = Mix.ar(sig).madd(0.2 * amp);
				mod = SinOsc.ar(1 / (3.rand + 2)).range(-0.25,0.25);
				sig = Pan2.ar(sig, mod);
				Out.ar(out,sig);
			}).add;

			/*SynthDef.new(\fadeInWithAutoPan, {
			arg buff = 0, out = 0, trig = 1, amp = 1, rateRatio = 1;
			var sig,mod;
			FreeSelf.kr(1 - trig * 2);
			sig = PlayBuf.ar(2, buff, BufRateScale.kr(buff) * rateRatio, doneAction: Done.freeSelf);
			sig = Mix.ar(sig).madd(0.2 * amp);
			mod = SinOsc.ar(1 / (3.rand + 2)).range(-0.25,0.25);
			sig = sig * EnvGen.kr(Env.new([0,1],[3]));
			sig = Pan2.ar(sig, mod);
			Out.ar(out,sig);
			}).add;*/

			/*6.do({arg i;
			p[\loopables][i] = Pbind(\instrument, \playBufWithAutoPan,\dur, Routine({loop{(10.rand + 15).yield}}),\buff, d.data.buffs[i + 5]);
			//p[\loopables][(i * 2) + 1] = d.filters.autoPan;
			});*/


			d.sourceSounds = (
				unveiling: {d.playThenLoop.(1)},
				unveiling1: {d.playThenLoop.(3)}
				//loopable: p[\loopables][0]
			);

			d.cues = ();
			d.cleanExec = {
				|cueNum|
				("cueNum: " ++ cueNum).postln;
				d.cues.values.do({|c| c.cleanup});
				("cue: " ++ d.cues[cueNum.asSymbol]).postln;
				d.cues[cueNum.asSymbol].exec;
			};

			s.sync;

			//High Phases
			d.phasesH = (
				highest: -2,
				lowest: 0,
				chordNum: 1,
				targHighest: 0,
				targLowest: 0,
				descendRate: 0.05,
				ascendRate: 1,
			);

			d.hbc = (
				chordNum: 1
			);

			s.sync;

			Routine {
				loop{
					if(d.phasesH.highest < d.phasesH.targHighest){d.phasesH.highest = d.phasesH.highest + 1};
					if(d.phasesH.highest > d.phasesH.targHighest){d.phasesH.highest = d.phasesH.highest - 1};
					(d.phasesH.ascendRate * (1 + (d.phasesH.targHighest - d.phasesH.highest).abs)).wait;
				}
			}.play;

			Routine {
				loop{
					if(d.phasesH.lowest < d.phasesH.targLowest){d.phasesH.lowest = d.phasesH.lowest + 1};
					if(d.phasesH.lowest > d.phasesH.targLowest){d.phasesH.lowest = d.phasesH.lowest - 1};
					(d.phasesH.descendRate * (1 + (d.phasesH.targLowest - d.phasesH.lowest).abs)).wait;
				}
			}.play;

			24.do({arg n;
				var amp = 1.1.pow(n.neg);
				~phasesH[n] = Pbind(
					\instrument, \playBufWithAutoPan,
					\buff, Pfunc({
						d.data.buffs[("chord" ++ d.phasesH.chordNum ++ "/many_octaves" ++ n).asSymbol]
					}),
					\trig, {if((n <= d.phasesH.highest) && (n >= d.phasesH.lowest)){1}{0}},
					\amp, amp,
					\dur, Routine({loop{(3.rand + 3).yield}}),
					\type, Pfunc({
						//("N BELOW HIGHEST: " ++ (n <= d.phasesH.highest)).postln;
						//("ABOVE LOWEST: " ++ (n >= d.phasesH.lowest)).postln;
						if((n <= d.phasesH.highest) && (n >= d.phasesH.lowest)) { \note } { \rest } })
				);
			});
			s.sync;
			~phasesH.pause;

			d.chordSwells = false;
			~chordSwells = Pbind(
				\instrument, \playBufWithAutoPan,
				\buff, Pfunc({
					//d.data.buffs[("chord" ++ d.phasesH.chordNum ++ "/chord").asSymbol]
					var chordKey = ("chord" ++ d.phasesH.chordNum ++ "/chord").asSymbol;
					if(d.data.buffs[chordKey].notNil) {
						d.data.buffs[chordKey]
					} {
						// Return a safe silent buffer or skip this event
						\rest  // This will cause the event to be skipped
					}
				}),
				\trig, {if(d.chordSwells){1}{\rest}},
				\amp, 1,
				\dur, Routine({loop{(10.rand + 20).yield;}}),
				//\rateRatio, Pfunc({[1,0.5].choose;}),//forgot we don't want bass in the beginning
				\type, Pfunc({ if(d.chordSwells && d.data.buffs[("chord" ++ d.phasesH.chordNum ++ "/chord").asSymbol].notNil) { \note } { \rest } })
			);
			s.sync;
			~chordSwells.pause;

			d.lowReg = false;
			6.do({arg n;
				~lowReg[n] = Pbind(
					\instrument, \playBufWithAutoPan,
					\buff, Pfunc({
						var chordKey = ("chord" ++ d.phasesH.chordNum ++ "/loopable" ++ n).asSymbol;
						if(d.data.buffs[chordKey].notNil) {
							d.data.buffs[chordKey]
						} {
							\rest
						}
					}),
					\trig, {if(d.lowReg){1}{\rest}},
					\amp, 1,
					\dur, Routine({loop{(5.rand + 10).yield;}}),
					\type, Pfunc({ if(d.lowReg && d.data.buffs[("chord" ++ d.phasesH.chordNum ++ "/loopable" ++ n).asSymbol].notNil) { \note } { \rest } })
				);
			});
			s.sync;
			~lowReg.pause;

			6.do({arg n;
				var amp = 1.1.pow(n.neg);
				~hbc[n] = Pbind(
					\instrument, \playBufWithAutoPan,
					\buff, Pfunc({
						d.data.buffs[("hbctext/hbc" ++ d.hbc.chordNum ++ "_" ++ n).asSymbol]
					}),
					/*\trig, {if((n <= d.phasesH.highest) && (n >= d.phasesH.lowest)){1}{0}},*/
					\trig, 1,
					\amp, amp,
					\dur, Routine({loop{(3.rand + 3).yield}}),
					\type, \note
					// \type, Pfunc({if((n <= d.phasesH.highest) && (n >= d.phasesH.lowest)) { \note } { \rest } })
				);
			});
			s.sync;
			~hbc.pause;

			//coda
			SynthDef.new(\hb, {
				arg buff, amp, pan = 0, out = 0;
				var sig, env;
				sig = PlayBuf.ar(1,buff,BufRateScale.kr(buff), doneAction: Done.freeSelf);
				sig = sig.madd(amp);
				env = EnvGen.kr(Env.perc, doneAction: Done.freeSelf);
				sig = sig * env;
				sig = Pan2.ar(sig, pan);
				Out.ar(out, sig);
			}).add;
			s.sync;

			d.chordTypes = (
				split11: [0,4,5,6,7,11],
				maj9Add6: [0,2,4,7,9,11]
			);

			d.coda = (
				prog: [[0, 9], [1, 3], [1, 7], [0, 1],
					[1, 9], [0, 3], [1, 11],
					[0, 9], [1, 3], [1, 1], [0, 7], [0, 5],
					[1, 9], [0, 3], [0, 7], [1, 1],
					[0, 9], [1, 3], [0, 11],
					[1, 9], [0, 3], [0, 1], [1, 7], [1, 5]
				],
				chordOptions: [0,1]
			);
			s.sync;

			d.makeCodaBells = {
				var octPhase = (2pi).rand, octPer = 10 + 5.0.rand, durPhase = (2pi).rand, durPer = 7 + 1.0.rand;
				Pbind(
					\instrument, \hb,
					\buff, Pfunc({
						var chordOptions, chordDef, chord, chordType, trans, oct, pc, note, targ;
						chordOptions = d.coda.chordOptions;
						d.coda.chordNum = chordOptions[((Main.elapsedTime / 10).floor) % chordOptions.size];
						chordDef = d.coda.prog[d.coda.chordNum];
						chordType = d.chordTypes.split11;
						if(chordDef[0] == 1){chordType = d.chordTypes.maj9Add6};
						trans = chordDef[1];
						chord = (chordType + trans) % 12;
						pc = chord.choose;

						targ = (12 * (3 + 3 * ((octPhase + (2pi * Main.elapsedTime / octPer)).sin + 1) / 2));

						oct = ((targ - pc) / 12).asInteger;//((targ - pc) / 12).round;//;((targ / pc).log / 2.log).round;//6.rand;

						note = 36 + (12 * oct) + pc;
						d.data.buffs[("Handbells/" ++ note).asSymbol];
					}),
					\amp, Pfunc({1.0.rand}),
					\dur, Pfunc({
						var durFact;
						durFact = 0.1 + (0.4 * (((durPhase + (2pi * Main.elapsedTime / durPer)).sin + 1) / 2));
						durFact + durFact.rand});
				);
			};

			d.filters.codaBellsFilter = \filter -> {
				|sig|
				var local, mix, decay = 0.9, outSig, env, trig;

				mix = SinOsc.kr(1/7.0,0.5).range(0,1);

				decay = mix.range(0.9,0);

				local = LocalIn.ar(2) + sig;
				10.do({
					var del = 0.05 + 0.5.rand;
					local = AllpassC.ar(local, del, del, 3);
				});
				local = LeakDC.ar(local);
				LocalOut.ar(local * decay);

				outSig = SelectX.ar(mix, [local, sig]);

				trig = Trig.kr((Latch.kr(WhiteNoise.kr(), Impulse.kr(1/SinOsc.kr(15).range(0.125,5))) > 0.5), 0.1);
				env = EnvGen.kr(Env.new([0,1,0],[1,0.1],[10,-3]),trig);

				(outSig * 0.1) + (outSig * 0.9 * env);

			};

			~codaBells1 = d[\makeCodaBells].value;
			~codaBells2 = d[\makeCodaBells].value;
			~codaBells3 = d[\makeCodaBells].value;

			~codaBells1[1] = d.filters.codaBellsFilter;
			~codaBells2[1] = d.filters.codaBellsFilter;
			~codaBells3[1] = d.filters.codaBellsFilter;

			~codaBells1[2] = d.filters.autopan;
			~codaBells2[2] = d.filters.autopan;
			~codaBells3[2] = d.filters.autopan;

			~codaBellsMix[0] = ~codaBells1;
			~codaBellsMix[1] = ~codaBells2;
			~codaBellsMix[2] = ~codaBells3;

			~codaBells = ~codaBellsMix;
			~codaBells[1] = \filter -> {
				|sig|
				var env;
				env = (SinOsc.kr(1/27.0).madd(3, 2.9)).clip;
				sig * env;
			};

			~codaBells[2] = \filter -> {
				|sig|
				FreeVerb2.ar(sig[0], sig[1], SinOsc.kr(1/10.0).range(0, 1), 0.9);
			};

			d.codaBellArr = [~codaBells1, ~codaBells2,~codaBells3];

			s.sync;
			d.codaBellArr.do{|cb| cb.pause};

			~mix = {SinOsc.kr(1/9.0).range(0.5,0.2)};
			~codaMix = (~codaBells * 0.1 * ~mix) + (~piano * (1 - ~mix));

			13.do({arg n;
				var buff = d.data.buffs[("amSpec_a" ++ (n+1)).asSymbol],
				rnd = 1.0.rand,
				buff1 = d.data.buffs[("amSpec_b" ++ (n+1)).asSymbol],
				buff2 = d.data.buffs[("amSpec_eb" ++ (n+1)).asSymbol];
				//rnd.postln;
				//buff.postln;
				if(buff.notNil){
					~amSpecA[n] = {var sig = PlayBuf.ar(2, buff, BufRateScale.kr(buff), loop: 1);
						Pan2.ar(Mix.ar(sig), SinOsc.kr(1/(5.0 + rnd), rnd).range(-0.5,0.5));
					}
				};
				if(buff1.notNil){
					~amSpecB[n] = {var sig = PlayBuf.ar(2, buff1, BufRateScale.kr(buff1), loop: 1);
						sig = Mix.ar(sig);
						sig = sig * 2.pow(-1 * n);
						Pan2.ar(sig, SinOsc.kr(1/(5.0 + rnd), rnd).range(-0.5,0.5));
					};
				};
				if(buff2.notNil){
					~amSpecEb[n] = {var sig = PlayBuf.ar(2, buff2, BufRateScale.kr(buff2), loop: 1);
						sig = Mix.ar(sig);
						sig = sig * 2.pow(-1 * n);
						Pan2.ar(sig, SinOsc.kr(1/(5.0 + rnd), rnd).range(-0.5,0.5));
					};
				};
			});

			//A spectrum
			~aSpec =  {d[\fadePlayer].(trig: \trig.kr(0), buf1: d.data.buffs["gradual_unveiling".asSymbol], buf2: d.data.buffs["loop".asSymbol])};
			~trans = {d[\transition].(buff: \buff.kr(d.data.buffs["chord5-6_mix".asSymbol]))};
			~trans1 = {d[\transition].(buff: \buff.kr(d.data.buffs["chord5-6_mix".asSymbol]))};
			~reverse = {d[\transition].(buff: \buff.kr(d.data.buffs["chord6/reverse".asSymbol]))};
			~crash = {
				var buff, sig, trig;
				trig = \trig.tr(0);
				buff = d.data.buffs[("drammaticCrashWithBuild1").asSymbol];
				sig = PlayBuf.ar(2, buff, BufRateScale.kr(buff), trig);
				sig = FreeVerb.ar(sig);
				sig;
			};


			SynthDef.new(\drone, {
				arg buff, out = 0;
				var sig, env;
				sig = PlayBuf.ar(2, buff, BufRateScale.kr(buff), doneAction: Done.freeSelf);
				env = EnvGen.kr(Env.new([0,1,1,0], [0.5,3,0.5]));
				Out.ar(out, sig * env);
			}).add;

			s.sync;

			~hbDrones = Pbind(
				\instrument, \drone,
				\buff, Routine({
					var n = 0;
					loop{
						var droneNum = 4;
						if(true){droneNum = 1 + 3.rand};
						n = n + 1;
						d.data.buffs[("hbc"++droneNum++"Drone").asSymbol].yield;
					};
				}),
				\dur, Pfunc({1 + 3.rand})
			);

			~hbDrones.pause;


			d.cueTimes = [0, (60 * 1) + 30, (60 * 2) + 45, (60 * 3) + 0, (60 * 3) + 15, (60 * 3) + 45,
				(60 * 4) + 45, (60 * 4) + 52, (60 * 5) + 00, (60 * 5) + 15, (60 * 5) + 22, (60 * 5) + 30, (60 * 5) + 45, (60 * 6) + 0, (60 * 6) + 15, (60 * 6) + 30, (60 * 6) + 45, (60 * 7) + 30, (60 * 7) + 45, (60 * 8) + 0, (60 * 8) + 15, (60 * 8) + 30, (60 * 8) + 45, (60 * 9) + 20];

			s.sync;
			//p[\electronics][0] = d.sourceSounds.unveiling;

			d[\init] = true;

			d.cues.putPairs(
				[\1, (
					exec: {
						var time = d.cueTimes[0];
						d[\gui][\startTime] = Main.elapsedTime;
						/*if(d[\gui][\shift]){
						~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
						d[\gui][\startTime] = Main.elapsedTime - time;
						};*/
						if(d[\init]){
							//s.record;
							//s.record(numChannels: 3);
							d[\init] = false;
						};

						//for testing
						d[\midiPiano] = {
							arg reset = 0;
							var phasor, buff, trig;
							buff = d.data.buffs[\piano];

							trig = \t_trig.kr(1);

							PlayBuf.ar(2,buff,BufRateScale.kr(buff), trig,reset);
						};

						if(d[\live]){
							~rawPiano = {SoundIn.ar(0)};
						}
						{
							~rawPiano = {d[\midiPiano].(reset: \reset.kr(0))} * 0.3;
							~drySimulator = ~rawPiano * 1;
							~drySimulator.play;
						};

						//otherwise ~rawPiano = {SoundIn.ar(0)};

						~aSpec.set(\cf, 0);//cancel out potential override

						~piano.fadeTime = 0;

						~pno1 = ~rawPiano * 8;
						~pno1[1] = d.filters.autoPan;
						~pno1[2] = d.filters.pbfb;
						~pno1[3] = d.filters.loopFilterLong;

						~piano = ~pno1;

						~electronics.fadeTime = 0;

						~electronics = ~aSpec * 0.2;//0.1;
						~aSpec.set(\trig, 0);
						~aSpec.set(\trig, 1);
					},
					cleanup: {
						//AppClock.clear;
						//~pno1.pause;
					},
					prep: {
					}
				),
				\2, (
					exec: {
						var time = d.cueTimes[1];
						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							~aSpec.set(\cf, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~piano.fadeTime = 1;

						~pno2 = ~rawPiano  * 8;
						~pno2[1] = d.filters.autoPan;
						~pno2[3] = d.filters.pbfb2;
						~pno2[4] = d.filters.loopFilterShort;
						/*~pno2[5] = \filter -> {
						|sig|
						var local;

						local = LocalIn.ar(2) + sig;
						local = DelayC.ar(local, 1,1);
						local = Convolution2.ar(local, d.data.buffs["hbLoop1".asSymbol]).madd(0.01);
						LocalOut.ar(local * 0.99);

						Mix.ar([local]);
						};*/


						/*~pno2[5] = \filter -> {
						|sig|
						var inB, chainA, chainB, chain, local, buff;
						chainA = 0!2;
						chainB = 0!2;
						chain = 0!2;
						buff = d.data.buffs["hbLoop1".asSymbol];

						inB = PlayBuf.ar(1,buff,BufRateScale.kr(buff), loop:1);

						local = sig;//LocalIn.ar(2) + sig;
						//local = DelayC.ar(local, 1,1);

						2.do({
						arg idx;
						chainA[idx] = FFT(LocalBuf(2048), local[idx]);
						chainB[idx] = FFT(LocalBuf(2048), inB);
						chain[idx] = PV_MagMul(chainA[idx], chainB[idx]);
						local[idx] = IFFT(chain[idx]) * 0.1;
						});

						//LocalOut.ar(local * 0.999);

						//Mix.ar([local]);
						local;
						//sig;

						};*/

						/*~pno2[5] = \filter -> {
						|sig|
						var inB, chainA, chainB, chain, buff, out;

						buff = d.data.buffs["hbLoop1".asSymbol];

						inB = PlayBuf.ar(1,buff,BufRateScale.kr(buff), loop:1);

						sig = Mix.ar(sig);

						chainA = FFT(LocalBuf(2048), sig);
						chainB = FFT(LocalBuf(2048), inB);
						3.do({chainA = PV_MagMul(chainA, chainB)});
						out = IFFT(chainA) * 0.1.pow(3);

						out.dup;

						};*/

						//~pno2[5] = {};

						//~electronics = {}

						~pno1[0] = {};//don't feed into it
						~pno2[6] = ~pno1;//but do continue the loop

						~piano = ~pno2;

						d.phasesH.highest = -2;
						d.phasesH.targHighest = 23;
						d.phasesH.lowest = 0;
						d.phasesH.targLowest = 0;
						d.phasesH.chordNum = 1;
						~phasesH.resume;
						~elec2 = ~phasesH * 0.8;
						~aSpec.set(\trig, 1);
						~elec2[1] = ~aSpec * {Line.kr(0.1, 0.4,75)};
						~elec2[2] = {
							var buff = d.data.buffs[("chord1/basicLoop").asSymbol];
							PlayBuf.ar(2, buff, BufRateScale.kr(buff), loop: 1)
							* EnvGen.ar(Env.new([0,0,1],[60 + 8, 30]))} * 1.5;//crescendo into chord change (and beyond)

						~electronics.fadeTime = 10;
						~electronics = ~elec2 * 0.8;
					},
					cleanup: {
						~phasesH.pause;
					},
					prep: {
					}
				),
				\3, (
					exec:{
						var time = d.cueTimes[2];
						~piano.fadeTime = 3;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
							d.phasesH.highest = 10;
						};

						~pno3 = ~rawPiano * 6;
						~pno3[1] = d.filters.autoPan;
						//~pno3[2] = d.filters.pbfb2;
						~pno3[3] = d.filters.pbfb1;
						~pno3[4] = d.filters.hold;

						~piano = ~pno3;

						d.phasesH.chordNum = 2;
						~phasesH.resume;
						d.phasesH.targHighest = 23;
						d.phasesH.lowest = 0;
						d.phasesH.targLowest = 0;

						~elec3 = ~phasesH * 0.9;
						~elec3[1] = {PlayBuf.ar(2, d.data.buffs["chord1-2_mix".asSymbol], BufRateScale.kr(d.data.buffs["chord1-2_mix".asSymbol]))} * 3;

						d.chordSwells = true;
						~chordSwells.resume;
						~elec3[2] = ~chordSwells * 1;
						~elec3Filt = ~elec3;
						~elec3Filt[1] = \filter -> {|sig| CombC.ar(sig, decaytime: 1)};

						~electronics.fadeTime = 5;
						~electronics = ~elec3Filt * 0.3;
					},
					cleanup: {
						d.chordSwells = false;
						~chordSwells.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\4, (
					exec: {
						var time = d.cueTimes[3];
						~piano.fadeTime = 3;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
							d.phasesH.highest = 23;
						};

						~pno4 = ~rawPiano * 5;
						~pno4[1] = d.filters.autoPan;
						~pno4[2] = \filter -> {|sig| CombC.ar(sig, decaytime: 3)};
						~pno4[3] = \filter -> {|sig| CombC.ar(sig, maxdelaytime: 0.7, delaytime: 0.7, decaytime: 3)};
						~pno4[4] = d.filters.hold;

						~pno4[5] = \filter -> {|sig|
							var local, selector;
							selector = EnvGen.kr(Env.new([1,1,0],[8,7]));

							local = LocalIn.ar(2);
							local = SelectX.ar(selector, [local + sig, local]);
							local = DelayC.ar(local, 5,5);
							LocalOut.ar(local);

							SelectX.ar(selector, [local,sig]);
						};

						~piano = ~pno4;

						d.phasesH.chordNum = 3;
						~phasesH.resume;
						d.phasesH.targHighest = 12;
						d.phasesH.lowest = 0;
						d.phasesH.targLowest = 0;

						~elec4 = ~phasesH * 0.9;
						d.chordSwells = true;
						~chordSwells.resume;
						~elec4[1] = ~chordSwells * 1;
						~elec4[2] = {
							var buff = d.data.buffs[("chord3/basicLoop").asSymbol];
							PlayBuf.ar(2, buff, BufRateScale.kr(buff), loop: 1)
							* EnvGen.ar(Env.new([0,0,1],[10, 30]))};//crescendo into chord change (and beyond)

						~elec4Filt = ~elec4;
						~elec4Filt[1] = \filter -> {|sig| CombC.ar(sig, decaytime: 3)};

						~elec4Filt[2] = {
							var sig;
							sig = PlayBuf.ar(2, d.data.buffs["bellPianoChord".asSymbol], BufRateScale.kr(d.data.buffs["bellPianoChord".asSymbol]));
							sig = FreeVerb2.ar(sig[0],sig[1]);
							sig;
						} * 0.7;

						~electronics.fadeTime = 3;
						~electronics = ~elec4Filt * 0.3;
					},
					cleanup: {
						d.chordSwells = false;
						~chordSwells.pause;
						~phasesH.pause;
					},
					prep: {},
				),
				\5, (
					exec:{
						var time = d.cueTimes[4];
						~piano.fadeTime = 3;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
							d.phasesH.highest = 18;
						};

						~pno5 = ~rawPiano * 6;
						~pno5[1] = d.filters.autoPan;
						~pno5[2] = \filter -> {|sig| CombC.ar(sig, decaytime: 3)};
						~pno5[3] = \filter -> {|sig| CombC.ar(sig, maxdelaytime: 0.7, delaytime: 0.7, decaytime: 3)};

						//~pno5[4] = d.filters.pbfb1;//?

						~pno5[5] = d.filters.hold;

						~pno4[0] = {};//stop feeding into it
						~pno5[5] = ~pno4 * {EnvGen.ar(Env.new([1,0],[8]))};//but keep plaing, fading for 8 sec
						~pno5[6] = \filter -> {|sig|
							var local, selector;
							selector = EnvGen.kr(Env.new([1,1,0],[20,10]));

							local = LocalIn.ar(2);
							local = SelectX.ar(selector, [local + sig, local]);
							local = DelayC.ar(local, 5,5);
							LocalOut.ar(local);

							SelectX.ar(selector, [local,sig]);
						};

						~piano = ~pno5;

						d.phasesH.chordNum = 4;
						~phasesH.resume;
						d.phasesH.targHighest = 23;
						d.phasesH.lowest = 0;
						d.phasesH.targLowest = 0;

						~elec5[0] = ~phasesH * 0.6 * {EnvGen.ar(Env.new([1,1,0,0,1],[14,1,12,4]))};
						~elec5[1] = {PlayBuf.ar(2, d.data.buffs["chord3-4_mix".asSymbol], BufRateScale.kr(d.data.buffs["chord3-4_mix".asSymbol]))} * 1.3;
						~elec5[2] = {
							var time, buff, gate;
							buff = d.data.buffs["chord4-4b_mix".asSymbol];

							gate = EnvGen.kr(Env([0, 0, 1], [5, 0]));
							PlayBuf.ar(2, buff, BufRateScale.kr(buff), gate);
						} * 1.5;
						~elec5[3] = {
							var time, buff, gate;
							buff = d.data.buffs["chord4b-4c_mix".asSymbol];

							gate = EnvGen.kr(Env([0, 0, 1], [10, 0]));
							PlayBuf.ar(2, buff, BufRateScale.kr(buff), gate);
						} * 1.5;
						~elec5[4] = {
							var time, buff, gate;
							buff = d.data.buffs["chord4c-4_mix".asSymbol];

							gate = EnvGen.kr(Env([0, 0, 1], [15, 0]));
							PlayBuf.ar(2, buff, BufRateScale.kr(buff), gate);
						} * 1.5;

						~hbTrills = {
							var buff1, buff2, buff3, sig, sig1, sig2, sig3, bot;
							buff1 = d.data.buffs[("trM1").asSymbol];
							buff2 = d.data.buffs[("trM2").asSymbol];
							buff3 = d.data.buffs[("trM3").asSymbol];

							bot = EnvGen.kr(Env.asr(20, curve: 0)).range(-1000, -1);

							sig1 = Mix.ar(PlayBuf.ar(2, buff1, BufRateScale.kr(buff1), loop: 1));
							sig2 = Mix.ar(PlayBuf.ar(2, buff2, BufRateScale.kr(buff1), loop: 1));
							sig3 = Mix.ar(PlayBuf.ar(2, buff3, BufRateScale.kr(buff1), loop: 1));

							sig = Mix.ar([Pan2.ar(sig1 * SinOsc.kr(1/5.0, pi / 2.0).range(bot,1).clip(0,1), SinOsc.kr(1/7.0).range(-1,1)),
								Pan2.ar(sig2 * SinOsc.kr(1/6.0, pi / 2.0).range(bot,1).clip(0,1), SinOsc.kr(1/5.0).range(-1,1)),
								Pan2.ar(sig2 * SinOsc.kr(1/7.0, pi / 2.0).range(bot,1).clip(0,1), SinOsc.kr(1/6.0).range(-1,1))]);

							sig = CombC.ar(sig, 0.25, 0.25,3);
							sig = CombC.ar(sig, 0.37, 0.37,3);
							sig = CombC.ar(sig, 0.643, 0.643,3);
							sig = FreeVerb.ar(sig);
							sig * 0.1;
						};

						~hbTrills[1] = d[\filtFuncs][\pbfb].value(-5.midiratio,
							0.3,//0.9, //local feedback in 0.5 sec loop
							0.5);
						~hbTrills[2] = d[\filtFuncs][\pbfb].value(-5.midiratio,
							0.3,//0.9, //local feedback in 0.5 sec loop
							0.1);
						~hbTrills[3] = \filter -> {|sig|
							3.do({
								sig = HPF.ar(sig,220);
							});
							sig;
						};

						~elec5[6] = ~hbTrills * 0.7 * {EnvGen.kr(Env.asr(3,1,1,0))};


						d.chordSwells = true;
						~chordSwells.resume;
						~elec5[2] = ~chordSwells * 1;

						~electronics.fadeTime = 5;
						~electronics = ~elec5 * 0.3;
						//~electronics[1] = \filter -> {|sig| CombC.ar(sig, decaytime: 3)};
					},
					cleanup: {
						d.chordSwells = false;
						~chordSwells.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\6, (
					exec:{
						var time = d.cueTimes[5];
						~piano.fadeTime = 14;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno6 = ~rawPiano * 1.8;
						~pno6[1] = d.filters.autoPan;
						~pno6[2] = d.filters.hold;
						~pno5[0] = {};//stop feeding into it
						~pno6[3] = ~pno5 * {EnvGen.kr(Env.new([1,0],[14]))} * 0.25;//but do play it
						~piano = ~pno6 * 4.0;

						d.lowReg = true;
						~lowReg.resume;
						d.phasesH.chordNum = 5;
						//~lowReg.play;

						~elec6 = {PlayBuf.ar(2, d.data.buffs["chord4/cresc2".asSymbol], BufRateScale.kr(d.data.buffs["chord4/cresc2".asSymbol]))} * 0.5;
						//~elec6[1] = ~lowReg * {EnvGen.kr(Env.new([0,0,1],[16,1]))} * 0.5;


						~spec6 = ~amSpecB * 0.05 * {SinOsc.kr(1/5.0).range(0.5,1)};
						~spec6[1] = d.filters.hold;
						~elec6[2] = ~spec6 * {EnvGen.kr(Env.new([0,0,1],[17,3]))};

						//this should be ok since the trig env is 45 seconds later (so buf should already be set)
						~reverse.set(\buff, d.data.buffs["chord5/reverse".asSymbol]);
						~triggerEnv = {
							EnvGen.kr(
								Env([0, 0, 1, 0], [45, 0.01, 0.01], \step),
								doneAction: 2  // free the synth when done
							)
						};
						~reverse.map(\trig, ~triggerEnv);

						//~reverse.set(\trig, 1);
						~elec6[3] = ~reverse * 0.09;


						~electronics.fadeTime = 15;
						~electronics = ~elec6;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\7, (
					exec:{
						var time = d.cueTimes[6];
						~piano.fadeTime = 1;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno7 = ~rawPiano * 2;
						~pno7[1] = d.filters.autoPan;
						~pno7[2] = d.filters.pbfb3;
						~pno7[3] = d.filters.hold;
						~piano = ~pno7 * 4;

						~electronics.fadeTime = 0.5;
						~spec7 = ~amSpecB * 0.1 * {SinOsc.kr(1/5.0).range(0.5,1)};
						~spec7[1] = d.filters.hold;
						~elec7 = ~spec7;


						~trans.set(\buff, d.data.buffs["chord5-6_mix".asSymbol], \trig, 1);

						~elec7[1] = ~trans * 0.7;
						~elec7[2] = ~reverse;

						/*{
						var buff = d.data.buffs["chord5-6_mix".asSymbol];
						PlayBuf.ar(2, buff, BufRateScale.kr(buff))} * 0.5;*/

						~electronics = ~elec7;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\8, (
					exec:{
						var time = d.cueTimes[7];
						~piano.fadeTime = 4;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						//reset delay
						~pno8 = ~rawPiano * 2;
						~pno8[1] = d.filters.autoPan;
						~pno8[2] = d.filters.pbfb3;
						~pno8[3] = d.filters.hold;
						~piano = ~pno8 * 4;

						~electronics.fadeTime = 0.5;

						~elec8 = ~trans * 0.7;
						~spec8 = ~amSpecEb * 0.1 * {SinOsc.kr(1/5.0).range(0.5,1)};
						~spec8[1] = d.filters.hold;
						~elec8[1] = ~spec8;
						~electronics = ~elec8;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\9, (
					exec:{
						var time = d.cueTimes[8];
						~piano.fadeTime = 0.1;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};



						~pno9 = ~rawPiano * 1.8;
						~pno9[1] = d.filters.autoPan;
						~pno9[2] = d.filters.hold;
						~pno8[0] = {};//don't input into pbfb3
						~pno9[3] = ~pno8 * {EnvGen.kr(Env.new([1,0],[5]))};//but keep playing it for 5 sec
						~piano = ~pno9 * 4;

						~electronics.fadeTime = 1;
						~spec9 = ~amSpecEb * 0.1 * {SinOsc.kr(1/5.0).range(0.5,1)};
						~spec9[1] = d.filters.hold;
						~elec9 = ~spec9;

						~reverse.set(\buff, d.data.buffs["chord6/reverse".asSymbol], \trig, 1);
						~elec9[1] = ~reverse * 0.7;
						~electronics = ~elec9;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\10, (
					exec:{
						var time = d.cueTimes[9];
						~piano.fadeTime = 1;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno10 = ~rawPiano * 1.8;
						~pno10[1] = d.filters.autoPan;
						~pno10[2] = d.filters.pbfb3;
						~pno10[3] = d.filters.hold;
						~piano = ~pno10 * 4;

						~electronics.fadeTime = 1;
						~spec10 = ~amSpecEb * 0.1 * {SinOsc.kr(1/5.0).range(0.5,1)};
						~spec10[1] = d.filters.hold;
						~elec10 = ~spec10;

						~trans.set(\buff, d.data.buffs["chord6-7_mix".asSymbol], \trig, 1);

						~elec10[1] = ~trans * 0.7;

						//~trans.play;

						~elec10[2] = ~reverse * 0.7;

						~electronics = ~elec10;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\11, (
					exec:{
						var time = d.cueTimes[10];
						~piano.fadeTime = 4;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						//reset delay
						~pno11 = ~rawPiano * 1.8;
						~pno11[1] = d.filters.autoPan;
						~pno11[2] = d.filters.pbfb3;
						~pno11[3] = d.filters.hold;
						~piano = ~pno11 * 4;

						//continue prev electronics
						~electronics.fadeTime = 1;
						~spec11 = ~amSpecB * 0.1 * {SinOsc.kr(1/5.0).range(0.5,1)};
						~spec11[1] = d.filters.hold;
						~elec11 = ~spec11;
						~elec11[1] = ~trans * 0.5;

						~electronics = ~elec11;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\12, (
					exec:{
						var time = d.cueTimes[11];
						~piano.fadeTime = 2;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno11[0] = {};//don't feed into pbfb3

						~pno12 = ~rawPiano * 1.8;
						~pno12[1] = d.filters.autoPan;
						~pno12[2] = d.filters.hold;
						~piano = ~pno12 * 4;

						~electronics.fadeTime = 2;
						~spec12 = ~amSpecB * 0.05 * {SinOsc.kr(1/5.0).range(0.5,1)};
						~spec12[1] = d.filters.hold;
						~elec12 = ~spec12;
						~electronics = ~elec12;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\13, (
					exec:{
						var time = d.cueTimes[12];
						~piano.fadeTime = 5;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno13 = ~rawPiano * 1.8;
						//~pno13[1] = d.filters.autoPan;
						~pno13[2] =  d[\filtFuncs][\pbfb].value(5.midiratio,
							0.3,//0.7, //local feedback in 0.1 sec loop
							0.1);//d.filters.pbfb;//\filter -> d.filtFuncs.pbfb.(-5.midiratio);

						~pno13[3] = \filter -> {|sig| CombC.ar(sig, 0.8, 0.8, decaytime: 10)};
						~pno13[4] =  d[\filtFuncs][\pbfb].value(5.midiratio,
							0.5,//0.7, //local feedback in 0.5 sec loop
							0.5);
						~pno13[5] = \filter -> {|sig| CombC.ar(sig, 0.7, 0.7, decaytime: 10)};
						~piano = ~pno13 * 0.5 * {EnvGen.kr(Env.new([1,1,0],[7.5,7.5],curve: [0,4]))};

						~electronics.fadeTime = 2;

						d.phasesH.highest = 23;
						d.phasesH.targHighest = 23;
						d.phasesH.lowest = 25;
						d.phasesH.targLowest = 0;
						d.phasesH.chordNum = 8;
						~phasesH.resume;
						~elec13 = ~phasesH * 0.25;

						~trans.set(\buff, d.data.buffs["chord8-9_morph".asSymbol], \trig, 1);
						~elec13[1] = ~trans * 0.7;

						~electronics = ~elec13;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\14, (
					exec:{
						var time = d.cueTimes[13];
						~piano.fadeTime = 5;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno14 = ~rawPiano  * 1.8;
						//~pno14[1] = d.filters.autoPan;
						~pno14[2] =  d[\filtFuncs][\pbfb].value(5.midiratio,
							0.3,//0.7, //local feedback in 0.1 sec loop
							0.1);//d.filters.pbfb;//\filter -> d.filtFuncs.pbfb.(-5.midiratio);

						~pno14[3] = \filter -> {|sig| CombC.ar(sig, 0.8, 0.8, decaytime: 10)};
						~pno14[4] =  d[\filtFuncs][\pbfb].value(5.midiratio,
							0.5,//0.7, //local feedback in 0.5 sec loop
							0.5);
						~pno14[5] = \filter -> {|sig| CombC.ar(sig, 0.7, 0.7, decaytime: 10)};
						~piano = ~pno14 * 0.5 * {EnvGen.kr(Env.new([0,1,0],[7.5,7.5],curve: [-4,4]))};

						~electronics.fadeTime = 2;

						d.phasesH.highest = 23;
						d.phasesH.targHighest = 23;
						d.phasesH.targLowest = 0;
						d.phasesH.chordNum = 9;
						~phasesH.resume;
						~elec14 = ~phasesH * 0.3;

						~trans1.set(\buff, d.data.buffs["chord9-10_morph".asSymbol], \trig, 1);
						~elec14[1] = ~trans * 0.7;
						~elec14[2] = ~trans1 * 0.7;

						~electronics = ~elec14;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\15, (
					exec:{
						var time = d.cueTimes[14];
						~piano.fadeTime = 5;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno15 = ~rawPiano  * 1.8;
						//~pno15[1] = d.filters.autoPan;
						~pno15[2] =  d[\filtFuncs][\pbfb].value(5.midiratio,
							0.3,//0.7, //local feedback in 0.1 sec loop
							0.1);//d.filters.pbfb;//\filter -> d.filtFuncs.pbfb.(-5.midiratio);

						~pno15[3] = \filter -> {|sig| CombC.ar(sig, 0.8, 0.8, decaytime: 10)};
						~pno15[4] =  d[\filtFuncs][\pbfb].value(5.midiratio,
							0.5,//0.7, //local feedback in 0.5 sec loop
							0.5);
						~pno15[5] = \filter -> {|sig| CombC.ar(sig, 0.7, 0.7, decaytime: 10)};
						~piano = ~pno15 * 0.5 * {EnvGen.kr(Env.new([0,1,0],[7.5,7.5],curve: [-4,4]))};

						~electronics.fadeTime = 2;

						d.phasesH.highest = 23;
						d.phasesH.targHighest = 23;
						d.phasesH.targLowest = 0;
						d.phasesH.chordNum = 9;
						~phasesH.resume;
						~elec15 = ~phasesH * 0.35;

						~trans.set(\buff, d.data.buffs["chord10-11_morph".asSymbol], \trig, 1);
						~elec15[1] = ~trans * 0.2;
						~elec15[2] = ~trans1 * 0.7;
						~hbcDroneLoop = {
							var buff, sig;
							buff = d.data.buffs["hbcDroneLoop".asSymbol];
							sig = PlayBuf.ar(2, buff, BufRateScale.kr(buff), loop: 1);
							sig = sig * EnvGen.ar(Env.new([0,1],[10]));
							sig = sig * SinOsc.kr(1/40.0).range(0,1);
							sig * 0.05;
						};
						~elec15[3] = ~hbcDroneLoop;

						~electronics = ~elec15;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\16, (
					exec:{
						var time = d.cueTimes[15];
						~piano.fadeTime = 5;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno16 = ~rawPiano * 1.8;
						//~pno16[1] = d.filters.autoPan;
						~pno16[2] =  d[\filtFuncs][\pbfb].value(5.midiratio,
							0.3,//0.7, //local feedback in 0.1 sec loop
							0.1);//d.filters.pbfb;//\filter -> d.filtFuncs.pbfb.(-5.midiratio);

						~pno16[3] = \filter -> {|sig| CombC.ar(sig, 0.8, 0.8, decaytime: 10)};
						~pno16[4] =  d[\filtFuncs][\pbfb].value(5.midiratio,
							0.5,//0.7, //local feedback in 0.5 sec loop
							0.5);
						~pno16[5] = \filter -> {|sig| CombC.ar(sig, 0.7, 0.7, decaytime: 10)};
						~piano = ~pno16 * 0.5 * {EnvGen.kr(Env.new([0,1,0],[7.5,7.5],curve: [-4,4]))};

						~electronics.fadeTime = 2;

						d.phasesH.highest = 23;
						d.phasesH.targHighest = 23;
						d.phasesH.targLowest = 0;
						d.phasesH.chordNum = 9;
						~phasesH.resume;
						~elec16 = ~phasesH * 0.4;

						~trans1.set(\buff, d.data.buffs["chord11-12_morph".asSymbol], \trig, 1);
						~elec16[1] = ~trans * 0.2;
						~elec16[2] = ~trans1 * 0.7;


						/*~triggerEnv = {
						EnvGen.kr(
						Env([0, 0, 1, 0], [0, 0.01, 0.01], \step),
						doneAction: 2  // free the synth when done
						)
						};*/
						~crash.set(\trig, 1);


						~elec16[3] = ~crash * 0.95;
						~elec16[4] = ~hbcDroneLoop;

						~electronics = ~elec16;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
					},
					prep: {

					}
				),
				\17, (
					exec:{
						var time = d.cueTimes[16];
						~piano.fadeTime = 0.5;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno17 = ~rawPiano * 2;
						~pno17[1] = d.filters.autoPan;
						~pno17[2] =  d.filters.hold;
						~piano = ~pno17 * 4;

						~electronics.fadeTime = 2;

						~elec17 = ~trans1 * 0.7;

						/*~hbDrones.resume;

						~lpDrones = ~hbDrones * {SinOsc.kr(1/5.0).range(0.005, 0.01)};
						~lpDrones[1] = \filter -> {|sig| LPF.ar(sig,1000)};*/

						d.codaBellArr.do{|cb| cb.resume};
						d.coda.factor = 1;
						~codaBells.set(\factor, 3);
						d.coda.chordOptions = [11];

						//~lpDrones.play;
						~elec17[1] = ~codaMix;
						~elec17[2] = ~crash * 0.95;

						~electronics = ~elec17;

					},
					cleanup: {
						d.lowReg = false;
						~lowReg.pause;
						~phasesH.pause;
						~hbDrones.pause;
					},
					prep: {

					}
				),
				\18, (
					exec:{
						var time = d.cueTimes[17];
						~piano.fadeTime = 2;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno18 = ~rawPiano * 2;
						~pno18[1] = d.filters.autoPan;
						~pno18[2] =  d.filters.hold;

						~pno17[0] = {};
						~pno18[3] = ~pno17;
						~piano = ~pno18 * 4;

						~electronics.fadeTime = 10;
						d.codaBellArr.do{|cb| cb.resume};
						d.coda.factor = 1;
						~codaBells.set(\factor, 1);
						d.coda.chordOptions = [12,13];

						~elec18 = ~codaMix;

						~gradualVeiling = {
							var buff, sig;
							buff = d.data.buffs["gradual_veiling_clustered3".asSymbol];
							sig = PlayBuf.ar(2, buff, BufRateScale.kr(buff));
							sig = sig * EnvGen.kr(Env.new([0,1,0.5,0],[20,80,20])) * SinOsc.kr(1/12.0,pi / 4.0).range(0,1);
							sig = FreeVerb2.ar(sig[0], sig[1]);
							sig * 0.2;
						};
						//~elec18[1] = ~gradualVeiling;
						~out[2] = ~gradualVeiling;
						~electronics = ~elec18;
					},
					cleanup: {
						d.codaBellArr.do{|cb| cb.pause};
					},
					prep: {

					}
				),
				\19, (
					exec:{
						var time = d.cueTimes[18];
						~piano.fadeTime = 2;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno19 = ~rawPiano * 2;
						~pno19[1] = d.filters.autoPan;
						~pno19[2] =  d.filters.hold;
						~pno18[0] = {};
						~pno19[3] = ~pno18;
						~piano = ~pno19 * 4;

						~electronics.fadeTime = 2;
						d.codaBellArr.do{|cb| cb.resume};
						d.coda.factor = 1;
						~codaBells.set(\factor, 1);
						d.coda.chordOptions = [14,15];
						~elec19 = ~codaMix;
						//~elect19[1] = ~gradualVeiling;
						~electronics = ~elec19;
					},
					cleanup: {
						d.codaBellArr.do{|cb| cb.pause};
					},
					prep: {

					}
				),
				\20, (
					exec:{
						var time = d.cueTimes[19];
						~piano.fadeTime = 2;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno20 = ~rawPiano * 2;
						~pno20[1] = d.filters.autoPan;
						~pno20[2] =  d.filters.hold;
						~pno19[0] = {};
						~pno20[3] = ~pno19;
						~piano = ~pno120 * 4;

						~electronics.fadeTime = 2;
						d.codaBellArr.do{|cb| cb.resume};
						d.coda.factor = 0.5;
						~codaBells.set(\factor, 0.5);
						d.coda.chordOptions = [16,17,18];
						~elec20 = ~codaMix;
						//~elect20[1] = ~gradualVeiling;
						~electronics = ~elec20;
					},
					cleanup: {
						d.codaBellArr.do{|cb| cb.pause};
					},
					prep: {

					}
				),
				\21, (
					exec:{
						var time = d.cueTimes[20];
						~piano.fadeTime = 2;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno21 = ~rawPiano * 2;
						~pno21[1] = d.filters.autoPan;
						~pno21[2] =  d.filters.hold;
						~pno20[0] = {};
						~pno21[3] = ~pno20;
						~piano = ~pno21 * 4;

						~electronics.fadeTime = 2;
						d.coda.factor = 1;
						d.codaBellArr.do{|cb| cb.resume};
						~codaBells.set(\factor, 1);
						d.coda.chordOptions = [19];

						~elec21 = ~codaMix * {EnvGen.kr(Env.new([1,0],[60]))};
						//~elect21[1] = ~gradualVeiling;
						~electronics = ~elec21;
					},
					cleanup: {
						d.codaBellArr.do{|cb| cb.pause};
					},
					prep: {

					}
				),
				\22, (
					exec:{
						var time = d.cueTimes[21];
						~piano.fadeTime = 2;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno22 = ~rawPiano * 2;
						~pno22[1] = d.filters.autoPan;
						~pno22[2] =  d.filters.hold;
						~pno21[0] = {};
						~pno22[3] = ~pno21;
						~piano = ~pno22 * 4;

						~electronics.fadeTime = 2;
						d.codaBellArr.do{|cb| cb.resume};
						~codaBells.set(\factor, 1);
						d.coda.chordOptions = [20,21];
						~elec22 = ~elec21;
						//~elect22[1] = ~gradualVeiling;
						~electronics = ~elec22;
					},
					cleanup: {
					},
					prep: {

					}
				),
				\23, (
					exec:{
						var time = d.cueTimes[22];
						~piano.fadeTime = 2;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno23 = ~rawPiano * 2;
						~pno23[1] = d.filters.autoPan;
						~pno23[2] =  d.filters.hold;
						~pno22[0] = {};
						~pno23[3] = ~pno22;
						~piano = ~pno23 * 4;

						~electronics.fadeTime = 2;
						d.coda.chordOptions = [22,23];
						d.codaBellArr.do{|cb| cb.resume};
						~codaBells.set(\factor, 1);
						~elec23 = ~elec21;
						//~elect23[1] = ~gradualVeiling;
						~electronics = ~elec23;
					},
					cleanup: {
					},
					prep: {

					}
				),
				\24, (
					exec:{
						var time = d.cueTimes[23];
						~piano.fadeTime = 1;

						if(d[\gui][\shift]){
							~rawPiano.set(\reset, 44100 * time, \t_trig, 1);
							d[\gui][\startTime] = Main.elapsedTime - time;
						};

						~pno24 = ~rawPiano * 2;
						//~pno24[1] = d.filters.autoPan;
						//~pno24[2] =  d.filters.hold;
						~piano = ~pno24 * 4;



						~electronics.fadeTime = 0;

						~elec24 = {
							var buff = d.data.buffs["morphLoop".asSymbol], sig;
							sig = PlayBuf.ar(2, buff, BufRateScale.kr(buff), loop: 1);
							sig = sig * EnvGen.kr(Env.new([1,0],[45],-3));
							//sig.dup;
							sig = LPF.ar(sig, 15000);
							sig * 0.005;
						};

						d.coda.chordOptions = [24];
						d.codaBellArr.do{|cb| cb.resume};
						~codaBells.set(\factor, 1);
						~elec24[1] = ~elec21;
						//~elect24[2] = ~gradualVeiling;

						~piano = ~elec24;
					},
					cleanup: {
					},
					prep: {

					}
				)



				]
			);
			s.sync;


			d.cues.values.do({arg cue;
				cue.prep;
			});

			~out.play;

			//~piano = {};
			~piano.fadeTime = 3;
			//~electronics = {};
			~electronics.fadeTime = 3;

			~out[0] = ~piano;
			~out[1] = ~electronics;

			/*p[\pianoFaded].fadeTime = 3;
			p[\electronicsFaded].fadeTime = 3;

			p[\piano][0] = p[\pianoFaded];
			p[\piano][1] = p[\pianoSub];

			p[\electronics][0] = p[\electronicsFaded];
			p[\electronics][1] = p[\electronicsSub];*/

			/*p[\pianoFaded] = {PlayBuf.ar(2, d.data.buffs[\pianoDyad], BufRateScale.kr(d.data.buffs[\pianoDyad]), loop: 1)};
			p[\pianoFaded][1] = d.filters.autoPan;
			p[\pianoFaded][2] = d.filters.pbfb2;//cue 2
			p[\pianoFaded][3] = d.filters.pbfb1;//cue 3
			p[\pianoFaded][4] = d.filters.hold;
			//p[\pianoEffects][3] = {};
			p[\pianoFaded][4] = {};*/

			d.test = {
				d.cueTimes.do({
					arg t, idx;
					{d[\cleanExec].(idx+1)}.defer(t);
				});
			};

			s.sync;
			{
				var filePath = Document.current.dir ++ "/resources/gui.scd";
				filePath.load;
			}.value;
			~phasesH.pause;
			~chordSwells.pause;
			~lowReg.pause;
			~hbDrones.pause;
			d.codaBellArr.do{|cb| cb.pause};
		};
	};
};
)
