#####################################################
# AB & Expectancy a la Martens & Johnson(2005)      #
#####################################################

scenario = "Expectancy & AB";
scenario_type = trials;

default_font = "Arial";

active_buttons = 25;
button_codes = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25;
#response_matching = simple_matching;

randomize_trials = false;	# 'true' randomizes order of trials
no_logfile = true;		# 'true' does NOT write log file to disk

pcl_file = "jimtap1.pcl";

default_max_responses = 2;
default_all_responses = true;     #prevents unwanted key presses from affecting timing	

begin;

#MUST MATCH VALUE OF nStim in PCL!!
$nStim = 40; # number of stimuli in target window + following 

picture {} default;
picture { bitmap { filename = "fixation.bmp"; }; x=0; y=0;} fixation; 

array {
picture { bitmap { filename = "dots0.bmp";}; x=0; y=0;};
picture { bitmap { filename = "dots1.bmp";}; x=0; y=0;};   
picture { bitmap { filename = "dots2.bmp";}; x=0; y=0;};
picture { bitmap { filename = "dots3.bmp";}; x=0; y=0;};
picture { bitmap { filename = "dots4.bmp";}; x=0; y=0;};
picture { bitmap { filename = "dots5.bmp";}; x=0; y=0;};
picture { bitmap { filename = "dots6.bmp";}; x=0; y=0;};
picture { bitmap { filename = "dots7.bmp";}; x=0; y=0;};
picture { bitmap { filename = "dots8.bmp";}; x=0; y=0;};
picture { bitmap { filename = "dots9.bmp";}; x=0; y=0;};
} stimuli;

array {
picture { bitmap { filename = "plet2.bmp";}; x=0; y=0;};
picture { bitmap { filename = "plet3.bmp";}; x=0; y=0;};   
picture { bitmap { filename = "plet4.bmp";}; x=0; y=0;};
picture { bitmap { filename = "plet5.bmp";}; x=0; y=0;};
picture { bitmap { filename = "plet6.bmp";}; x=0; y=0;};
picture { bitmap { filename = "plet7.bmp";}; x=0; y=0;};
picture { bitmap { filename = "plet8.bmp";}; x=0; y=0;};
picture { bitmap { filename = "plet9.bmp";}; x=0; y=0;};
picture { bitmap { filename = "plet10.bmp";}; x=0; y=0;};
picture { bitmap { filename = "plet11.bmp";}; x=0; y=0;};
} pseudo;

text {
   caption = "A"; 
   font_size = 28;      
   font_color = 167,167,167;
   preload = false;
} t1;

# These stimuli are preallocated for performance in postt1_trial
# The LOOP allows us to create sequences of arbitrary length ($nStims) 
# SDL must reference the text objects by name (hence "postt1_$k")
# PCL can reference the text objects by indexing the array postt1
array {
	LOOP $i $nStim;
	$k = '$i + 1'; # LOOP is zero indexed for some reason
	text { caption = "A"; font_size = 28; 
			 font_color = 167,167,167; preload = true; } "postt1_$k";
	ENDLOOP;
} postt1;

array {
	LOOP $i 12;
	$k = '$i + 1';
	text { caption = "A"; font_size = 28; 
			 font_color = 167,167,167; preload = true; } "rsvp_$k";
	ENDLOOP;
} rsvp;

text {
   caption = "A"; 
   font_size = 28;  
   font_color = 0,0,0;
   preload = true;
} isi_text;

text {
   caption = "!"; 
   font_size = 20;      
   font_color = 167,167,167;
   preload = false;
} fb_msg;

trial {
	trial_duration = forever;
	trial_type = correct_response;
	stimulus_event {
		picture fixation;
		target_button=22;
		code="Fixation";
	} fix_event;
} fix_trial;

trial {
	stimulus_event {
		picture fixation;
		target_button=3;
		duration=249;
		code="Fixation";
	} fix2_event;
} fix2_trial;

array {
	LOOP $i 12;
	$k = '$i + 1';
	trial {
		stimulus_event {  
			picture {text "rsvp_$k"; x = 0; y = 0; };  
			duration=8;
			code="RSVP";
		};
	};
	ENDLOOP;
} rsvpdig_trials;

# This trial displays the post T1 stimuli in rapid sequence
# It can handle an arbitrary number of stimuli ($nStim)
# The stimuli are assigned values in PCL by modifying postt1[]
$rStim = '$nStim - 1'; # since postt1_1 must start at time 0
trial {
	trial_duration=2500; 
   picture {text postt1_1; x = 0; y = 0;};
	time=0;
   picture {text isi_text; x = 0; y = 0;};
	deltat=8;

	LOOP $i $rStim;
		$j = '$i + 2';
		picture {text "postt1_$j"; x = 0; y = 0;};
		deltat=38;
		picture {text isi_text; x = 0; y = 0;};
		deltat=8;
	ENDLOOP;			
} postt1_trial;   

trial {
	stimulus_event {  
      picture default;  
		duration=38;
		code="RSVP";
	} rsvpdot_event;
} rsvpdot_trial;

trial {
	trial_duration = forever;
	trial_type = correct_response;
	stimulus_event {
	picture {
		text {
			caption = "Block is done!\n\nTake a break!\n\nPress [space] key to start next block\n";
			font_size = 22;
		} block_text;
		x=0; y=0;
	};
	target_button=22;
	code="INTER-BLOCK INTERVAL";
	} block_event;
} block_trial; 

trial {
	stimulus_event {
      picture default;
		duration=38;
		code="ISI";
	} isi_event;
} isi_trial;
	
trial {
	stimulus_event {
      picture {
         text t1;  
         x = 0; y = 0;
      };
		duration=29;
		code="T1";
	} t1_event;
} t1_trial;

trial {
	stimulus_event {
      picture default;
		duration=1;
		code="T1 START";
	};
} t1_start;

trial {
	stimulus_event {
      picture default;
		duration=1;
		code="T1 END";
	};
} t1_end;

trial {
	stimulus_event {
      picture { 
			text fb_msg;  
			x = 0; y = 0;
      };
		duration=499;
		code="T1";
	} fb_event;
} fb_trial;

trial {
	trial_duration = forever;
	trial_type = first_response;
	stimulus_event {
     picture {
	   text { caption = "Letter?";
	          font_size=20; };
      x = 0; y = 0;
      };
		target_button=22;
		code="T2 Response";
	} t2resp_event;
} t2resp_trial;  

# This part is necessary for entering subject number
trial {
	stimulus_event {
	picture {
		text {
			caption = "Type in your experiment number (two digits)...\n";
			font_size = 16;
		} number_text;
		x=0; y=0;
	};
	} number_event;
} number_trial;  

# This displays at the end of the experiment
trial {
	trial_duration = forever;
	trial_type = correct_response;
	stimulus_event {
     picture {
	   text { caption = "Experiment Complete!\nTHANK YOU!\nPlease get the experimenter.";
	          font_size=18;
	   };
         x = 0; y = -200;
      };
		target_button=25;
		code="End";
	} done_event;
} done_trial;  

# This displays instructions
trial {
	trial_duration = forever;
	trial_type = correct_response;
	stimulus_event {
     picture {
	   text { caption = "INSTRUCTIONS
								
								Every trial in the experiment will begin a fixation cross on the screen.
								When you are looking at the fixation, press the spacebar to begin.
								You will first see a stream of 6-12 digits at the center of the screen followed by three asterisks and them some more digits.
								The asterisks are a signal for you to tap the space bar twice within the next 2 seconds.
								Try to space your taps out, but be sure that both taps been completed within 2 seconds.
								While you are tapping, one letter will be presented among the digits.
								Try to see it and type the letter on the keyboard at the end of the trial.
								Once the digits have stopped streaming, you will receive feedback about the timing of your taps and a prompt to key in the letter you saw.
								You can enter the letter as slowly as you like. Focus on getting the letter correct rather than quickly.
								Once you have typed the letter the fixation will re-appear and you can start the next trial.
								
								Press the spacebar to start the experiment";
	          font_size=18;
	   };
         x = 0; y = 200;
      };
		target_button=22;
		code="Instructions";
	} inst_event;
} inst_trial;  
