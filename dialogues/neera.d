/////////////////////////////////////////////////////////////////////////
// Dialogues for Neera to allow for her to leave after Korlasz Quest //
// Compiled via main_common.tpa                                        //
/////////////////////////////////////////////////////////////////////////

// ToDo: Give her a split of the gold but destroy about half of it immediately
// 		in case she's in SoD or BG2 because she'd spend it

CHAIN
	IF WEIGHT #-999 ~Global("#L_NeeraModded","GLOBAL",0) Global("EndOfBG1","GLOBAL",0) Global("#l_SarvQuests","GLOBAL",99) GlobalLT("#L_NPCPK","GLOBAL",2) !AreaType(DUNGEON) CombatCounter(0)~ THEN NEERAJ_ POST_KORLASZ_ASK
		@2358 /* ~You're in the clear now, right?  Can I go?~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2326 /* ~I too have other places to be.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2338 /* ~Yes, *we* should go.~ */ 
		== KHALIJ IF ~OR(2) !IsValidForPartyDialogue("JAHEIRA") !Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2332 /* ~I-I should be going as well.~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2326 /* ~I too have other places to be.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2340	/* ~Me as well.~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2347 /* ~(gives you an exaggerated yawn)~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2360 /* ~You hog all the limelight.~ */
	END
	+ ~!Global("#L_LetsHaveFun","GLOBAL",1)~ + @2279 /* ~Please don't go yet.  I still need you, for just a few more days.~ */ + POST_KORLASZ_STAY
	+ ~Global("#L_LetsHaveFun","GLOBAL",1)~ + @2280 /* ~Please let me treat you to a little fun before you go.  Will a day or two make that much difference?~ */  + POST_KORLASZ_STAY
	++ @2281 /* ~Of course you may leave, but not with that equipment.~ */  + POST_KORLASZ_STAY
	++ @2282 /* ~I understand.  Now is as good a time as any to say our farewells.~ */ + POST_KORLASZ_LEAVE

CHAIN
	IF ~~ THEN NEERAJ_ POST_KORLASZ_STAY
		@2355 /* ~Ok, for a little while.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2327 /* ~So be it.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2333	/* ~If you insist.~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2283 /* ~As you wish.  I owe you that at least.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2341	/* ~I can stay for a little while.~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2348 /* ~Fine. (sigh)~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2361	/* ~Have it your way, as always!~ */
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",2)~ EXIT

CHAIN
	IF ~~ THEN NEERAJ_ POST_KORLASZ_LEAVE
		@2356 /* ~See ya!  Good luck and all.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2328 /* ~Take care of yourself.~ */ DO ~SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("JAHEIRA",LeaveParty()) ActionOverride("JAHEIRA",EscapeArea())~
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2334 /* ~Goodbye.~ */ DO ~SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346	/* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2349 /* ~Finally!~ */ DO ~SetGlobal("L_EdwinOkInBG1Areas","GLOBAL",1) ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",EscapeArea())~
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2362 /* ~Look for my name in lights, I'm bowing out of this dump!~ */ DO ~SetGlobal("L_BaelothOkInBG1Areas","GLOBAL",1) ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCPK","GLOBAL",3) SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) ActionOverride("Neera",LeaveParty()) ActionOverride("Neera",EscapeArea())~ EXIT

CHAIN
	IF WEIGHT #-998 ~Global("#L_NeeraModded","GLOBAL",0) Global("#L_NPCSoD","GLOBAL",0) Global("EndOfBG1","GLOBAL",1) GlobalGT("#L_StartCaelarAttack","GLOBAL",0)~ THEN NEERAJ_ PRE_SOD_WARNING
		@2359 /* ~You're great and all, but I really have to get outta here.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== KHALIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2339 /* ~Yes, *we* really must go.~ */ 
		== KHALIJ IF ~OR(2) !IsValidForPartyDialogue("JAHEIRA") !Global("#L_JaheriaModded","GLOBAL",0) IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2335 /* ~I must go as well~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2343 /* ~Time to go!~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2350 /* ~I'm so done.~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2363	/* ~I couldn't agree more.~ */
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2367 /* ~I can't wait any longer, either.~ */
		== XANJ IF ~IsValidForPartyDialogue("XAN") Global("#L_XanModded","GLOBAL",0)~ @2373 /* ~I need to report back to Evereska.~ */
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_NPCSoD","GLOBAL",ONE_MINUTE)~ EXIT

CHAIN
	IF WEIGHT #-997 ~Global("#L_NeeraModded","GLOBAL",0) GlobalGT("#L_NPCSoD","GLOBAL",0) GlobalTimerExpired("#L_NPCSoD","GLOBAL") Global("#L_NPCSoDLeft","GLOBAL",0)~ THEN NEERAJ_ PRE_SOD_LEAVE
		@2356 /* ~See ya!  Good luck and all.~ */
		== JAHEIJ IF ~IsValidForPartyDialogue("JAHEIRA") Global("#L_JaheriaModded","GLOBAL",0)~ @2328 /* ~Take care of yourself.~ */ DO ~SetGlobal("L_JaheiraOkInBG1Areas","GLOBAL",1) ActionOverride("JAHEIRA",LeaveParty()) ActionOverride("JAHEIRA",EscapeArea())~		
		== KHALIJ IF ~IsValidForPartyDialogue("KHALID") Global("#L_KhalidModded","GLOBAL",0)~ @2334 /* ~Goodbye.~ */ DO ~SetGlobal("L_KhalidOkInBG1Areas","GLOBAL",1) ActionOverride("KHALID",LeaveParty()) ActionOverride("KHALID",EscapeArea())~
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~		
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2353 /*~I'm outta here!~ */ DO ~SetGlobal("L_EdwinOkInBG1Areas","GLOBAL",1) ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",EscapeArea())~
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2362 /* ~Look for my name in lights, I'm bowing out of this dump!~ */ DO ~SetGlobal("L_BaelothOkInBG1Areas","GLOBAL",1) ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",EscapeArea())~
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */ DO ~SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) ActionOverride("GARRICK",LeaveParty()) ActionOverride("GARRICK",EscapeArea())~
		== XANJ IF ~IsValidForPartyDialogue("XAN") Global("#L_XanModded","GLOBAL",0)~ @2374 /* ~Farewell though I certainly shall not.~ */ DO ~SetGlobal("L_XanOkInBG1Areas","GLOBAL",1) ActionOverride("XAN",LeaveParty()) ActionOverride("XAN",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCSoDLeft","GLOBAL",1) SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) ActionOverride("Neera",LeaveParty()) ActionOverride("Neera",EscapeArea())~ EXIT

CHAIN
	IF WEIGHT #-996 ~Global("#L_NeeraModded","GLOBAL",0) Global("#L_NPCBG2","GLOBAL",0) Global("#L_StartBG2","GLOBAL",1)~ THEN NEERAJ_ PRE_BG2_WARNING
		@2359 /* ~You're great and all, but I really have to get outta here.~ */
		= @2324 /* ~If I am carrying anything you'd prefer to keep, let's exchange equipment now.~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2329 /* ~I too will be leaving.~ */
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2343 /* ~Time to go!~ */
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2350 /* ~I'm so done.~ */
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2363	/* ~I couldn't agree more.~ */
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2367 /* ~I can't wait any longer, either.~ */
		== XANJ IF ~IsValidForPartyDialogue("XAN") Global("#L_XanModded","GLOBAL",0)~ @2373 /* ~I need to report back to Evereska.~ */
	END
	IF ~~ THEN DO ~SetGlobalTimer("#L_NPCBG2","GLOBAL",ONE_MINUTE)~ EXIT

CHAIN
	IF WEIGHT #-995 ~Global("#L_NeeraModded","GLOBAL",0) GlobalGT("#L_NPCBG2","GLOBAL",0) GlobalTimerExpired("#L_NPCBG2","GLOBAL") Global("#L_NPCBG2Left","GLOBAL",0)~ THEN NEERAJ_ PRE_BG2_GOODBYE
		@2356 /* ~See ya!  Good luck and all.~ */
		== AJANTJ IF ~IsValidForPartyDialogue("AJANTIS") Global("#L_AjantisModded","GLOBAL",0)~ @2284 /* ~It has been an honor.  Farewell.~ */ DO ~SetGlobal("L_AjantisOkInBG1Areas","GLOBAL",1) ActionOverride("AJANTIS",LeaveParty()) ActionOverride("AJANTIS",EscapeArea())~		
		== DORNJ_ IF ~IsValidForPartyDialogue("DORN") Global("#l_DornModded","GLOBAL",0)~ @2346 /* ~Until we meet again.~ */ DO ~SetGlobal("L_DornOkInBG1Areas","GLOBAL",1) ActionOverride("DORN",LeaveParty()) ActionOverride("DORN",EscapeArea())~
		== EDWINJ_ IF ~IsValidForPartyDialogue("EDWIN") Global("#L_EdwinModded","GLOBAL",0)~ @2353 /*~I'm outta here!~ */ DO ~SetGlobal("L_EdwinOkInBG1Areas","GLOBAL",1) ActionOverride("EDWIN",LeaveParty()) ActionOverride("EDWIN",EscapeArea())~
		== BAELOTHJ IF ~IsValidForPartyDialogue("BAELOTH") Global("#L_BaelothModded","GLOBAL",0)~ @2362 /* ~Look for my name in lights, I'm bowing out of this dump!~ */ DO ~SetGlobal("L_BaelothOkInBG1Areas","GLOBAL",1) ActionOverride("BAELOTH",LeaveParty()) ActionOverride("BAELOTH",EscapeArea())~
		== GARRIJ IF ~IsValidForPartyDialogue("GARRICK") Global("#L_GarrickModded","GLOBAL",0)~ @2368 /* ~Farewell, <CHARNAME>.  I shall immortalize your name in song!~ */ DO ~SetGlobal("L_GarrickOkInBG1Areas","GLOBAL",1) ActionOverride("GARRICK",LeaveParty()) ActionOverride("GARRICK",EscapeArea())~
		== XANJ IF ~IsValidForPartyDialogue("XAN") Global("#L_XanModded","GLOBAL",0)~ @2374 /* ~Farewell though I certainly shall not.~ */ DO ~SetGlobal("L_XanOkInBG1Areas","GLOBAL",1) ActionOverride("XAN",LeaveParty()) ActionOverride("XAN",EscapeArea())~
	END
	IF ~~ THEN DO ~SetGlobal("#L_NPCBG2Left","GLOBAL",1) SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) ActionOverride("Neera",LeaveParty()) ActionOverride("Neera",EscapeArea())~ EXIT


APPEND_EARLY NEERAP_
	IF WEIGHT #-999 ~Global("#L_NeeraModded","GLOBAL",0) Global("#l_SarvQuests","GLOBAL",99) Global("#L_NeeraPK","GLOBAL",0)~ THEN BEGIN POST_KORLASZ_GOODBYE1
		// Didn't lead the conversation when Korlasz was handed in
		// Or wasn't in the group at the time
		// So hasn't given his 'I'm eager' spiel
		// Let him say it now
		SAY @2359 /* ~You're great and all, but I really have to get outta here.~ */
		= @2356 /* ~See ya!  Good luck and all.~ */
		IF ~~ THEN DO ~SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END

	IF WEIGHT #-998 ~Global("#L_NeeraModded","GLOBAL",0) Global("#l_SarvQuests","GLOBAL",99) Global("#L_NeeraPK","GLOBAL",1)~ THEN BEGIN POST_KORLASZ_GOODBYE2
		// We've already done the 'I'm eager' spiel
		// He's being let go from group after initially being asked to stay
		SAY @2356 /* ~See ya!  Good luck and all.~ */
		IF ~~ THEN DO ~SetGlobal("L_NeeraOkInBG1Areas","GLOBAL",1) EscapeArea()~ EXIT
	END
END
