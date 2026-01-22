// ============================================================================
// PERFORMANCE GUI - Dark Mode Edition
// ============================================================================
// A sleek, modular GUI for live performance with SuperCollider
// Compatible with ProxySpace - uses d[\key] instead of ~tilde vars
// ============================================================================

(
// Initialize GUI state in global dictionary
d[\gui] = d[\gui] ?? { () };
d[\gui][\currentCue] = 1;
d[\gui][\startTime] = Main.elapsedTime;
d[\gui][\window] = nil;
d[\gui][\test] = false;
d[\gui][\lastElapsed] = -1;

// Define cue key mapping (qwerty layout, left to right, top to bottom)
d[\gui][\cueKeys] = "qwertyuiopasdfghjklzxcvbnm1234567890";

// ============================================================================
// TIME FORMATTING UTILITY
// ============================================================================
d[\formatTime] = { |elapsed|
	var minutes = (elapsed / 60).floor;
	var seconds = (elapsed % 60).floor;
	format("% : %",
		minutes.asString.padLeft(2, "0"),
		seconds.asString.padLeft(2, "0")
	);
};

// ============================================================================
// CUE EXECUTION WITH LOGGING
// ============================================================================
d[\executeCue] = { |cueNum|
	var elapsed = Main.elapsedTime - d[\gui][\startTime];
	var timeStr = d[\formatTime].(elapsed);

	// Log to post window
	postln("\n═══════════════════════════════════");
	postln("CUE % activated at %".format(cueNum, timeStr));
	postln("═══════════════════════════════════\n");

	// Update current cue
	d[\gui][\currentCue] = cueNum;

	// Update GUI display if it exists
	if(d[\gui][\cueNumText].notNil, {
		{ d[\gui][\cueNumText].string = "CUE %".format(cueNum); }.defer;
	});

	// Execute the actual cue (safely)
	if(d[\cleanExec].notNil, {
		d[\cleanExec].(cueNum);
	}, {
		"Warning: d[\\cleanExec] not defined".postln;
	});
};

// ============================================================================
// CREATE THE MAIN GUI
// ============================================================================
d[\createPerformanceGUI] = {
	var win, mainView, topBar, specView, levelView;
	var timeText, cueNumText, levelMeter;
	var freqScope, scopeBus, levelBus;
	var timeUpdate, levelUpdate, levelMessanger;
	var instructionsView, instrWidth;

	// Close existing window if present
	if(d[\gui][\window].notNil, { d[\gui][\window].close; });

	// Reset start time
	d[\gui][\startTime] = Main.elapsedTime;
	d[\gui][\currentCue] = 1;

	// Create window with dark theme
	win = Window("◆ PERFORMANCE CONTROL ◆", Rect(100, 100, 1000, 680))
	.background_(Color.new(0.12, 0.12, 0.14))
	.onClose_({
		timeUpdate.stop;
		if(levelUpdate.notNil, { levelUpdate.stop });
		d[\gui][\window] = nil;
	});

	mainView = View(win, win.view.bounds.insetBy(20, 20))
	.background_(Color.new(0.12, 0.12, 0.14));

	// ========================================================================
	// TOP BAR - Time Display & Cue Counter
	// ========================================================================
	topBar = View(mainView, Rect(0, 0, mainView.bounds.width, 80))
	.background_(Color.new(0.18, 0.18, 0.22));

	// Elapsed time display
	timeText = StaticText(topBar, Rect(20, 10, 300, 60))
	.string_("00 : 00")
	.font_(Font("Monaco", 48, true))
	.stringColor_(Color.new(0.4, 0.9, 0.95))
	.align_(\left);

	// Current cue display
	cueNumText = StaticText(topBar, Rect(topBar.bounds.width - 250, 10, 230, 60))
	.string_("CUE 1")
	.font_(Font("Monaco", 36, true))
	.stringColor_(Color.new(0.95, 0.85, 0.3))
	.align_(\right);

	d[\gui][\cueNumText] = cueNumText;

	// ========================================================================
	// SPECTROGRAPH SECTION
	// ========================================================================
	specView = View(mainView, Rect(0, 100, mainView.bounds.width - 120, 460))
	.background_(Color.new(0.08, 0.08, 0.1));

	// Create frequency scope
	freqScope = FreqScopeView(specView, specView.bounds.insetBy(10, 10), s);

	freqScope.background_(Color.new(0.08, 0.08, 0.1));
	freqScope.waveColors_([Color.new(0.3, 0.8, 0.9, 0.8)]);

	freqScope.fill_(true);

	freqScope.freqMode_(1);
	freqScope.active_(true);

	freqScope.inBus_(0);
	freqScope.dbRange_(96);

	freqScope.freqMode.postln;

	//freqScope.active_(true);
	// freqScope.start;

	win.onClose_({freqScope.kill});

	// ========================================================================
	// LEVEL METER SECTION
	// ========================================================================
	levelView = View(mainView, Rect(mainView.bounds.width - 100, 100, 100, 460))
	.background_(Color.new(0.18, 0.18, 0.22));

	levelMeter = LevelIndicator(levelView, Rect(30, 20, 40, 420))
	.warning_(0.7)
	.critical_(0.9)
	.background_(Color.new(0.1, 0.1, 0.12))
	.numSteps_(40)
	.drawsPeak_(true)
	.numTicks_(9)
	.numMajorTicks_(3);

	// Level monitoring routine
	/*levelUpdate = Routine({
	var bus = In.ar(0,2);//Bus(\audio, 0, 2);
	loop {
	bus.get({ |val|
	{ levelMeter.value = val.ampdb.linlin(-60, 0, 0, 1); }.defer;
	});
	0.05.wait;
	};
	}).play(AppClock);*/

	levelMessanger = {
		var colum, noise, imp, delimp, mul = 1;
		imp = Impulse.kr(10);
		delimp = Delay1.kr(imp);
		colum = Mix.ar(~out) * mul;
		// measure rms and Peak
		SendReply.kr(imp, '/levels', [Amplitude.kr(colum), K2A.ar(Peak.ar(colum, delimp).lag(0, 3))]);
		//colum;
	}.play;


	levelUpdate = OSCFunc({arg msg;
		{
			levelMeter.value = msg[3].ampdb.linlin(-40, 0, 0, 1);
			levelMeter.peakLevel = msg[4].ampdb.linlin(-40, 0, 0, 1);
		}.defer;
	}, '/levels', s.addr);

	levelMeter.onClose_({levelUpdate.free; levelMessanger.free;});

	// ========================================================================
	// INSTRUCTIONS PANEL
	// ========================================================================
	instructionsView = View(mainView, Rect(0, 570, mainView.bounds.width, 70))
	.background_(Color.new(0.08, 0.08, 0.1));

	// Accent line at top
	/*View(instructionsView, Rect(0, 0, instructionsView.bounds.width, 2))
	.background_(Color.new(0.95, 0.85, 0.3));*/

	View(instructionsView, Rect(0, 0, instructionsView.bounds.width, 2))
	.background_(Color.new(0.4, 0.6, 0.65, 0.4));
	View(instructionsView, Rect(0, instructionsView.bounds.height - 2, instructionsView.bounds.width, 2))
	.background_(Color.new(0.4, 0.6, 0.65, 0.4));
	View(instructionsView, Rect(0, 0, 2, instructionsView.bounds.height))
	.background_(Color.new(0.4, 0.6, 0.65, 0.4));
	View(instructionsView, Rect(instructionsView.bounds.width - 2, 0, 2, instructionsView.bounds.height))
	.background_(Color.new(0.4, 0.6, 0.65, 0.4));

	// Title
	StaticText(instructionsView, Rect(20, 12, 200, 20))
	.string_("KEYBOARD  CONTROLS")
	.font_(Font("Monaco", 10, true))
	.stringColor_(Color.new(0.4, 0.7, 0.8))
	.align_(\left);

	// Instructions in columns
	instrWidth = (instructionsView.bounds.width - 40) / 4;

	StaticText(instructionsView, Rect(20, 38, instrWidth, 25))
	.string_("SPACE  ∙  Sequential")
	.font_(Font("Monaco", 11))
	.stringColor_(Color.new(0.85, 0.9, 0.95))
	.align_(\left);

	StaticText(instructionsView, Rect(20 + instrWidth, 38, instrWidth, 25))
	.string_("← / →  ∙  Navigate")
	.font_(Font("Monaco", 11))
	.stringColor_(Color.new(0.85, 0.9, 0.95))
	.align_(\left);

	StaticText(instructionsView, Rect(20 + (instrWidth * 2), 38, instrWidth, 25))
	.string_("Q-M, 1-0  ∙  Jump to Cue")
	.font_(Font("Monaco", 11))
	.stringColor_(Color.new(0.85, 0.9, 0.95))
	.align_(\left);

	StaticText(instructionsView, Rect(20 + (instrWidth * 3), 38, instrWidth, 25))
	.string_("ESC  ∙  Emergency Stop")
	.font_(Font("Monaco", 11))
	.stringColor_(Color.new(1.0, 0.4, 0.5))
	.align_(\left);

	// ========================================================================
	// TIME UPDATE ROUTINE
	// ========================================================================
	timeUpdate = Routine({
		loop {
			var elapsed = Main.elapsedTime - d[\gui][\startTime];
			{ timeText.string = d[\formatTime].(elapsed); }.defer;

			/*if(d[\gui][\test]){
				d[\cueTimes].do({|ct, idx|
					if((ct <= elapsed) && (ct > d[\gui][\lastElapsed])){d[\cleanExec].(idx+1)}
				});
			};*/

			d[\gui][\lastElapsed] = elapsed;
			0.1.wait;
		};
	});

	// ========================================================================
	// KEYBOARD CONTROL
	// ========================================================================
	win.view.keyDownAction = { |view, char, modifiers, unicode, keycode|
		var charStr = char.asString;
		var cueIndex;

		d[\gui][\shift] = modifiers.isShift;

		case
		// ESCAPE - Emergency stop and recompile
		{ keycode == 53 } {
			postln("\n╔════════════════════════════════════════════════╗");
			postln("║     EMERGENCY STOP - Recompiling...            ║");
			postln("╚════════════════════════════════════════════════╝\n");

			// Stop all sound
			Server.killAll;

			// Close window
			win.close;

			// Recompile class library (full reset)
			thisProcess.recompile;
		}

		// SPACE BAR - Sequential cue progression
		{ char == $  } {
			//("EXECUTING CUE: " ++ d[\gui][\currentCue]).postln;
			d[\executeCue].(d[\gui][\currentCue]);
			if(d[\gui][\currentCue] == 1){timeUpdate.play(AppClock)};
			//("INCREMENTING CUE: " ++ d[\gui][\currentCue]).postln;
			d[\gui][\currentCue] = d[\gui][\currentCue] + 1;
			//("CUE VALUE: " ++ d[\gui][\currentCue]).postln;
		}

		// LEFT ARROW - Previous cue
		{ keycode == 123 } {
			d[\gui][\currentCue] = max(1, d[\gui][\currentCue] - 1);
			d[\executeCue].(d[\gui][\currentCue]);
		}

		// RIGHT ARROW - Next cue
		{ keycode == 124 } {
			d[\gui][\currentCue] = d[\gui][\currentCue] + 1;
			d[\executeCue].(d[\gui][\currentCue]);
		}

		// QWERTY KEYS - Direct cue access
		{
			// Only process if charStr is a single character
			if(charStr.size == 1, {
				cueIndex = d[\gui][\cueKeys].find(charStr);
				//charStr.postln;
				if(charStr == "`"){
					d[\test].();
					d[\gui][\test] = d[\gui][\test].not;
					if(d[\gui][\test]){"TEST".postln};
					//d[\gui][\startTime] = Main.elapsedTime;
					timeUpdate.play(AppClock);
				};
				if(cueIndex.notNil, {
					d[\gui][\currentCue] = cueIndex + 1;
					d[\executeCue].(d[\gui][\currentCue]);
				});
			});
		};
	};

	win.view.keyUpAction = { |view, char, modifiers, unicode, keycode|
		d[\gui][\shift] = modifiers.isShift;
	};

	// ========================================================================
	// FINALIZE
	// ========================================================================
	d[\gui][\window] = win;
	d[\gui][\timeUpdate] = timeUpdate;
	d[\gui][\levelUpdate] = levelUpdate;

	win.front;
	win.view.focus;

	postln("\n╔════════════════════════════════════════════════╗");
	postln("║     PERFORMANCE GUI READY                      ║");
	postln("╠════════════════════════════════════════════════╣");
	postln("║  SPACE      → Sequential cues                  ║");
	postln("║  ← / →      → Navigate cues                    ║");
	postln("║  Q-M, 1-0   → Direct cue access                ║");
	postln("║  ESCAPE     → Emergency stop & recompile       ║");
	postln("╚════════════════════════════════════════════════╝\n");
};

// Launch the GUI
d[\createPerformanceGUI].value;
)

// ============================================================================
// USAGE NOTES
// ============================================================================
// Save this file separately (e.g., "performance_gui.scd")
// Load it from your main patch with: "performance_gui.scd".loadPaths;
//
// Make sure d[\cleanExec] is defined before launching GUI:
// d[\cleanExec] = { |cueNum| /* your cue execution logic */ };
// ============================================================================