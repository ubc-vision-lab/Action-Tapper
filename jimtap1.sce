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

default_max_responses = 1;
default_all_responses = false;     #prevents unwanted key presses from affecting timing	

begin;

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

array {
   stimulus_event{
      picture {
         text {
            caption = "A";
         font_size = 28;
         font_color = 167,167,167;
         preload = false;
         }
         x = 0;
         y = 0;
      };
      time = 0;
   };
   LOOP $i 39;
   stimulus_event{
      picture {
         text {
            caption = "A";
         font_size = 28;
         font_color = 167,167,167;
         preload = false;
         }
         x = 0;
         y = 0;
      };
      deltat = 39;
   };
   ENDLOOP;
} postt1;

text {
   caption = "A"; 
   font_size = 28; 
   font_color = 167,167,167;
   preload = false;
} rsvp;
          
text {
   caption = "A"; 
   font_size = 28;      
   font_color = 167,167,167;
   preload = false;
} t1;

text {
   caption = "A"; 
   font_size = 28;  
   font_color = 0,0,0;
   preload = true;
} isi_text;

stimulus_event {
   picture {
      text isi_text;
      x = 0;
      y = 0;
   } isi_picture;
   deltat = 9;
} isi_stim;

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

trial {
	stimulus_event {  
      picture {
         text rsvp;  
         x = 0; y = 0;
      };
		duration=29;
		code="RSVP";
	} rsvpdig_event;
} rsvpdig_trial;   

trial {
#	trial_type=first_response;
	trial_duration=2500;
#	all_responses=true;
 #   picture {
 #      text postt1[0];
 #      x = 0;
 #      y = 0;
 #   };
 #   time = 0;
 #   picture {
 #      text isi_text;
 #      x = 0;
 #      y = 0;
 #   };
 #   deltat = 9;
	# LOOP $j 39;
	# 	picture {
	# 		text postt1['$j+1'];
	# 		x = 0;
	# 		y = 0;
	# 	};
	# 	deltat = 39;
	# 	picture {
	# 		text isi_text;
	# 		x = 0;
	# 		y = 0;
	# 	};
 #      deltat = 9;
	# ENDLOOP;
} postt1_trial;

trial {
	stimulus_event {  
      picture default;  
		duration=29;
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
		duration=69;
		code="";
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
      picture {
	   text { caption = "Too slow!";
	          font_size=20;
	   };
         x = 0; y = 0;
      };
		duration=499;
		code="T1";
	} tooslow_event;
} tooslow_trial;

trial {
	stimulus_event {
      picture {
	   text { caption = "Didn't tap!";
	          font_size=20;
	   };
         x = 0; y = 0;
      };
		duration=499;
		code="T1";
	} notap_event;
} notap_trial;

trial {
	stimulus_event {
      picture {
	   text { caption = "Too fast!";
	          font_size=20;
	   };
         x = 0; y = 0;
      };
		duration=499;
		code="T1";
	} toofast_event;
} toofast_trial;

trial {
	stimulus_event {
      picture {
	   text { caption = "Good tap!";
	          font_size=20;
	   };
         x = 0; y = 0;
      };
		duration=499;
		code="T1";
	} justright_event;
} justright_trial;

trial {
	trial_duration = forever;
	trial_type = first_response;
	stimulus_event {
     picture {
	   text { caption = "Letter?";
	          font_size=20;
	   };
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
	   text { caption = "INSTRUCTIONS\n\nEvery trial in this experiment will begin with the presentation of a fixation at the centre of the screen.\nWhen you are looking at fixation, press the spacebar to begin.\nYou will see a stream of 6-12 digits at the centre of the screen that you can ignore and then three asterisks.\nOnce the asterisks appear, you should press the spacebar within the next second.\nAcross the different trials, try to tap the spacebar at a variety of evenly-spaced intervals.\nAfter the asterisks, several more digits will be presented along with one letter that can be anything except for I, O, Q, P or Z.\nYou will then receive feedback about the timing of your tap and a prompt to report the letter you saw.\nYou can enter the letter as slowly as you like - concentrate on accuracy rather than speed.\nOnce you have typed the letter, the fixation will re-appear and you can start the next trial!\n\nPress the spacebar to start the experiment";
	          font_size=18;
	   };
         x = 0; y = 200;
      };
		target_button=22;
		code="Instructions";
	} inst_event;
} inst_trial;  
