#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Pixel, Relative

PrintScreen & ScrollLock::reload
Pause::pause

[::
mouseGetPos, x, Y
tooltip, It's at %x% - %y%
return

numpad0::
BlockInput, On
BlockInput, SendAndMouse
BlockInput, MouseMove

boss_rush = 151, 58

prestige = 32, 130
prestige_prestige = 247, 752
prestige_normal_map = 179, 336
prestige_close = 430, 162

monster_layout = 459, 129
monster_layout_1_load = 401, 378

monster_close = 459, 798
level_up = 328, 798
level_up_close = 455, 798
drone_swarm = 33, 186
drone_swarm_close = 457, 281
drone_swarm_play = 248, 619
cargo_carrier = 30, 243
cargo_carrier_close = 436, 232
cargo_carrier_play = 241, 684
tech_ship = 34, 299
tech_ship_play = 241, 688
tech_ship_close = 433, 223

close_active_play = 492, 320

skill1 = 137, 809
skill2 = 210, 809
skill3 = 290, 809
skill4 = 359, 809


normal_cursedclouds1 = 205, 416
normal_cursedclouds2 = 209, 239
normal_beachrun_1 = 183, 287
normal_beachrun_2 = 183, 443
normal_enchantedforest1 = 185, 212
normal_enchantedforest2 = 207, 477
normal_snowfall1 = 181, 267
normal_snowfall2 = 181, 451
normal_lavacave1 = 195, 449
normal_lavacave2 = 363, 416
normal_deadwood1 = 209, 286
normal_deadwood2 = 338, 586



rot1_pos1 = %normal_cursedclouds1%
rot1_pos2 = %normal_cursedclouds2%
rot2_pos1 = %normal_beachrun_1%
rot2_pos2 = %normal_beachrun_2%
rot3_pos1 = %normal_enchantedforest1%
rot3_pos2 = %normal_enchantedforest2%
rot4_pos1 = %normal_snowfall1%
rot4_pos2 = %normal_snowfall2%
rot5_pos1 = %normal_lavacave1%
rot5_pos2 = %normal_lavacave2%
rot6_pos1 = %normal_deadwood1%
rot6_pos2 = %normal_deadwood2%

;pos3 = %normal_beachrun_1%
;pos4 = %normal_lavacave1%
; pos5 = 279, 439
; pos6 = 277, 528
; pos7 = 276, 629
; pos8 = 279, 695
; pos9 = 199, 657
; pos10 = 453, 429

loop,  {
	loop, 100 {
		random, sleep1, 75, 250
		random, sleep2, 75, 250
		 
		; monsters to level up
		click, %pos1%
		sleep, %sleep1%
		click, %level_up%
		sleep, %sleep2%
		random, sleep1, 75, 250
		random, sleep2, 75, 250
		click, %pos2%
		sleep, %sleep1%
		click, %level_up%
		sleep, %sleep2%	
		click, %level_up_close%
		sleep, %sleep2%
		;click, %tech_ship%
		;sleep, %sleep1%
		;click, %tech_ship_play%
		;sleep, %sleep1%
		;click, %tech_ship_close%
		;sleep, %sleep1%
		; random, sleep1, 75, 250
		; random, sleep2, 75, 250
		
		
		;click, %close_active_play%
		;sleep, %sleep2%	
		
		
		; drone swarm
		click, %drone_swarm%
		sleep, %sleep2%
		random, sleep1, 75, 250
		random, sleep2, 75, 250
		click, %drone_swarm_play%
		sleep, %sleep1%
		click, %drone_swarm_close%
		sleep, %sleep2%
		;cargo carrier
		click, %cargo_carrier%
		sleep, %sleep1%
		random, sleep1, 75, 250
		random, sleep2, 75, 250
		click, %cargo_carrier_play%
		sleep, %sleep2%
		click, %cargo_carrier_close%
		sleep, %sleep1%
		;spells
		click, %skill1% ; slot 1
		sleep, %sleep2%
		random, sleep1, 75, 250
		random, sleep2, 75, 250
		click, %skill2% ; slot 2
		sleep, %sleep1%
		click, %skill3% ; slot 3
		sleep, %sleep2%
		random, sleep1, 75, 250
		random, sleep2, 75, 250
		click, %skill4% ; slot 4
		sleep, %sleep1%
		}
		
	click, %prestige%
	sleep, %sleep1%
	click, %prestige_prestige%
	sleep, %sleep2%
	click, %prestige_close%
	sleep, %sleep1%
	click, %prestige_normal_map%
	sleep, 10000 ;10 seconds
	click, %monster_layout%
	sleep, %sleep1%
	click, %monster_layout_1_load%
	sleep, %sleep2%	
	click, %boss_rush%
	
	}

