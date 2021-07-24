#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Pixel, Relative

ScrollLock::reload
Pause::pause

;;use this to get start: x, y and end: x, y coordinates 
[::
mouseGetPos, x, Y
Clipboard = %x%, %y%
tooltip, It's at %x% - %y%
return

^numpad0::
;; window size must be set to 480x854 for code to work - game played on STEAM
;; to make sure it's launched at this resolution
;; right-click Idle Monsters TD > Properties... > LAUNCH OPTIONS > type this is field >> -screen-width 480 -screen-height 854
;; load the game and you're set

if not WinActive("IdlesMonsterTD")
	WinActivate, IdleMonsterTD
	MouseMove, 100, 100

;;this'll block any mouse and keyboard inputs to make sure you don't screw up and accidentally click off game screen,
;;creating some irritating catastrophe
;;if you do somehow go offscreen, code further down will reactivate Idle Monsters TD window
;;if for some ultra rare reason things go out of control and you can't stop the script from loading every program,
;;you have then 'IMMEDIATELY': [CTRL+ALT+DELETE] > [TASK MANAGER] > click [AUTOHOTKEY UNICODE 64-BIT] > press [DELETE] key
;;if for some ultra * infinity reason it fails, then restarting your PC is your only option: it happened once out of,
;;the hundred of tests I've done so don't expect it too occur unless your unlucky
BlockInput, On
BlockInput, SendAndMouse
BlockInput, MouseMove

; image location variable
image_folder = F:\CACHE DRIVE\.Studies\Images\idle_monster_td\ ;;if images not in same folder then replace this with image location minus filename
;onscreen variables for determining which is clickable, ignoring what is not
boss_rush = %image_folder%boss_rush.png
button_prestige = %image_folder%button_prestige.png
button_prestige_prestige = %image_folder%button_prestige_prestige.png
button_prestige_prestige_lets_go = %image_folder%button_prestige_prestige_lets_go.png
button_layout_monster_close = %image_folder%button_layout_monster_close.png
button_layout_monster = %image_folder%button_layout_monster.png
button_layout_monster_load = %image_folder%button_layout_monster_load.png
button_layout_monster_save = %image_folder%button_layout_monster_save.png
button_layout_monster_close = %image_folder%button_layout_monster_close.png
button_monster_level_up_upgrade_purchase_minimal = %image_folder%button_monster_level_up_upgrade_purchase_minimal.png
button_monster_level_up_upgrade_purchase_minimal_inactive = %image_folder%button_monster_level_up_upgrade_purchase_minimal_inactive.png
button_monster_level_expand = %image_folder%button_monster_level_expand.png
button_monster_level_collapse = %image_folder%button_monster_level_collapse.png
button_monster_level_close = %image_folder%button_monster_level_close.png
bonus_close_variation_1 = %image_folder%bonus_close_variation_1.png
bonus_close_variation_2 = %image_folder%bonus_close_variation_2.png
bonus_close_variation_3 = %image_folder%bonus_close_variation_3.png
bonus_close_variation_4 = %image_folder%bonus_close_variation_4.png
bonus_close_variation_5 = %image_folder%bonus_close_variation_5.png
bonus_close_variation_6 = %image_folder%bonus_close_variation_6.png
bonus_drone_swarm = %image_folder%bonus_drone_swarm.png
bonus_drone_swarm_play = %image_folder%bonus_drone_swarm_play.png
bonus_cargo_carrier = %image_folder%bonus_cargo_carrier.png
bonus_cargo_carrier_play = %image_folder%bonus_cargo_carrier_play.png
bonus_cargo_carrier_close = %image_folder%bonus_cargo_carrier_close.png
bonus_active_play_variation_1 = %image_folder%bonus_active_play_variation_1.png
bonus_active_play_variation_2 = %image_folder%bonus_active_play_variation_2.png
bonus_active_play_variation_3 = %image_folder%bonus_active_play_variation_3.png
bonus_active_play_variation_4 = %image_folder%bonus_active_play_variation_4.png
bonus_active_play_variation_5 = %image_folder%bonus_active_play_variation_5.png
bonus_active_play_variation_6 = %image_folder%bonus_active_play_variation_6.png
bonus_tech_ship = %image_folder%bonus_tech_ship.png
bonus_tech_ship_play = %image_folder%bonus_tech_ship_play.png
drone_swarm_close = %image_folder%button_prestige
cargo_carrier_close = %image_folder%button_prestige
tech_ship_close = %image_folder%button_prestige
skill_slot_1 = %image_folder%skill_slot.png
skill_slot_2 = %image_folder%skill_slot.png
skill_slot_3 = %image_folder%skill_slot.png
skill_slot_4 = %image_folder%skill_slot.png
misc_death_skull = %image_folder%misc_death_skull.png
misc_daily_rewards_available = %image_folder%misc_daily_rewards_available.png
misc_daily_rewards_claim_now = %image_folder%misc_daily_rewards_claim_now.png
;variable containing the assets needed to determine which map you're on
map_normal_cursed_clouds_asset = %image_folder%map_normal_cursed_clouds_asset.png
map_normal_beach_run_asset = %image_folder%map_normal_beach_run_asset.png
map_normal_enchanted_forest_asset = %image_folder%map_normal_enchanted_forest_asset.png
map_normal_snowfall_asset = %image_folder%map_normal_snowfall_asset.png
map_normal_lava_cave_asset = %image_folder%map_normal_lava_cave_asset.png
map_normal_deadwood_asset = %image_folder%map_normal_deadwood_asset.png
; map_resource_farm_asset = %image_folder%map_resource_farm_asset.png
; map_bonus_deep_push_asset = %image_folder%map_bonus_deep_push_asset.png

;; Main code begins here
while True {
	;;in case the window somehow goes to the background - it's happened to me somehow
	if not WinActive("IdlesMonsterTD")
		WinActivate, IdleMonsterTD
		MouseMove, 100, 100

	;;detects if death skull is on screen
	;;once it is it'll wait 10.5 seconds to ensure it is gone and then begin to prestige
	;;it may fail at times, but overall will work 99% of the time (totally arbitrary number)
	ImageSearch, death_x, death_y, 204, 456, 295, 484, %misc_death_skull%
	if (errorlevel=0) { ; DEBUG: STAYS COMMENTED UNTIL ALL MAPS HAVE MONSTER LOCATION VARIABLES
		click, %death_x%, %death_y%
		MouseMove, 0, 0
		sleep, 10500
		ImageSearch, button_prestige_x, button_prestige_y, 0, 0, 61, 159, %button_prestige%
		click, %button_prestige_x% %button_prestige_y%
		sleep, 250
		ImageSearch, button_prestige_prestige_x, button_prestige_prestige_y, 0, 0, 366, 782, %button_prestige_prestige%
		click, %button_prestige_prestige_x% %button_prestige_prestige_y%
		sleep, 250
		ImageSearch, button_prestige_prestige_lets_go_x, button_prestige_prestige_lets_go_y, 0, 0, 266, 364, %button_prestige_prestige_lets_go%
		click, %button_prestige_prestige_lets_go_x% %button_prestige_prestige_lets_go_y%
		sleep, 7500
		ImageSearch, button_layout_monster_x, button_layout_monster_y, 435, 97, 491, 160, %button_layout_monster%
		click, %button_layout_monster_x% %button_layout_monster_y%
		sleep, 250
		ImageSearch, button_layout_monster_load_x, button_layout_monster_load_y, 337, 356, 460, 405, %button_layout_monster_load%
		click, %button_layout_monster_load_x% %button_layout_monster_load_y%
		sleep, 250
		ImageSearch, button_layout_monster_save_x, button_layout_monster_save_y, 219, 357, 337, 407, %button_layout_monster_save%
		click, %button_layout_monster_save_x% %button_layout_monster_save_y%
		sleep, 250
	}

	;;daily rewards: you can nest this segment within any of the map asset if statements if you want to only activate
	;;it in a specific map ex. only activate daily rewards in beach run
	ImageSearch, misc_daily_rewards_available_x, misc_daily_rewards_available_y, 9, 776, 59, 829, %misc_daily_rewards_available% 
	sleep, 50
	click, %misc_daily_rewards_available_x% %misc_daily_rewards_available_y%	
	sleep, 50
	ImageSearch, misc_daily_rewards_claim_now_x, misc_daily_rewards_claim_now_y, 133, 501, 362, 566, %misc_daily_rewards_claim_now% 
	sleep, 50
	click, %misc_daily_rewards_claim_now_x% %misc_daily_rewards_claim_now_y%	
	sleep, 50

	;;determines which map you are in and assigns coordinate to dps and support monster
	;;this is unique to my layout so get the coordinates for your dps and support using the left square bracket key
	;;and them to the map you're in
	ImageSearch, x, y, 450, 336, 472, 361, %map_normal_cursed_clouds_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 159, monster_position_dps_y = 204
		monster_position_support_x = 211, monster_position_support_y = 503
	}
	ImageSearch, x, y, 126, 627, 159, 661, %map_normal_beach_run_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 179, monster_position_dps_y = 528
		monster_position_support_x = 316, monster_position_support_y = 287
	}
	ImageSearch, x, y, 59, 666, 116, 714, %map_normal_enchanted_forest_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 210, monster_position_dps_y = 474
		monster_position_support_x = 314, monster_position_support_y = 643
	}
	ImageSearch, x, y, 356, 84, 438, 156, %map_normal_snowfall_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 179, monster_position_dps_y = 447
		monster_position_support_x = 311, monster_position_support_y = 449
	}
	ImageSearch, x, y, 132, 595, 198, 665, %map_normal_lava_cave_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 371, monster_position_dps_y = 412
		monster_position_support_x = 368, monster_position_support_y = 478
	}
	ImageSearch, x, y, 71, 574, 102, 608, %map_normal_deadwood_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 341, monster_position_dps_y = 355
		monster_position_support_x = 341, monster_position_support_y = 595
	}

	;; Bonus Maps: WON'T BE CODED IN FOR AWHILE, NEED TO UNLOCK
	; ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_resource_farm_asset%
	; if (errorlevel=0) {
	; 	monster_position_dps_x = 159, monster_position_dps_y = 204
	; 	monster_position_support_x = 211, monster_position_support_y = 503
	; }
	; ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_bonus_deep_push_asset%
	; if (errorlevel=0) {
	; 	monster_position_dps_x = 159, monster_position_dps_y = 204
	; 	monster_position_support_x = 211, monster_position_support_y = 503
	; }

	;;locates specific images onscreen and activates them if possible
	;;it should be done quickly because of reduced search area

	;; Uncomment if you want boss rush on
	; ImageSearch, boss_rush_x, boss_rush_y, 128, 27, 183, 86, %boss_rush%
	; 	click, %boss_rush_x% %boss_rush_y%
	; 	sleep, 50
	;; Uncomment if you want boss rush on

	; ImageSearch, button_monster_level_expand_x, button_monster_level_expand_y, 371, 768, 430, 830, %button_monster_level_expand%
	ImageSearch, button_monster_level_collapse_x, button_monster_level_collapse_y, 368, 578, 434, 638, %button_monster_level_collapse%
		click, %button_monster_level_collapse_x% %button_monster_level_collapse_y%
		sleep, 50

	;;bonuses sidebar
	ImageSearch, bonus_drone_swarm_x, bonus_drone_swarm_y, 9, 160, 58, 206, %bonus_drone_swarm%
		click, %bonus_drone_swarm_x% %bonus_drone_swarm_y%
		sleep, 50
	ImageSearch, bonus_drone_swarm_play_x, bonus_drone_swarm_play_y, 133, 582, 362, 645, %bonus_drone_swarm_play%
		click, %bonus_drone_swarm_play_x% %bonus_drone_swarm_play_y%
		sleep, 50	
	ImageSearch, bonus_cargo_carrier_x, bonus_cargo_carrier_y, 8, 216, 59, 266, %bonus_cargo_carrier%
		click, %bonus_cargo_carrier_x% %bonus_cargo_carrier_y%
		sleep, 50
	ImageSearch, bonus_cargo_carrier_play_x, bonus_cargo_carrier_play_y, 133, 643, 366, 710, %bonus_cargo_carrier_play%
		click, %bonus_drone_swarm_play_x% %bonus_cargo_carrier_play_y%
		sleep, 50
	ImageSearch, bonus_tech_ship_x, bonus_tech_ship_y, 9, 270, 61, 323, %bonus_tech_ship%
		click, %bonus_tech_ship_x% %bonus_tech_ship_y%
		sleep, 50
	ImageSearch, bonus_tech_ship_play_x, bonus_tech_ship_play_y, 137, 658, 362, 725, %bonus_tech_ship_play%
		click, %bonus_tech_ship_play_x% %bonus_tech_ship_play_y%
		sleep, 50

	;;since close buttons seem to differ from one another though they look the same these are it's variations
	ImageSearch, bonus_close_variation_1_x, bonus_close_variation_1_y, 368, 44, 474, 417, %bonus_close_variation_1%
		click, %bonus_close_variation_1_x% %bonus_close_variation_1_y%
		sleep, 50
	ImageSearch, bonus_close_variation_2_x, bonus_close_variation_2_y, 368, 44, 474, 417, %bonus_close_variation_2%
		click, %bonus_close_variation_2_x% %bonus_close_variation_2_y%
		sleep, 50
	ImageSearch, bonus_close_variation_3_x, bonus_close_variation_3_y, 368, 44, 474, 417, %bonus_close_variation_3%
		click, %bonus_close_variation_3_x% %bonus_close_variation_3_y%
		sleep, 50
	ImageSearch, bonus_close_variation_4_x, bonus_close_variation_4_y, 368, 44, 474, 417, %bonus_close_variation_4%
		click, %bonus_close_variation_4_x% %bonus_close_variation_4_y%
		sleep, 50
	ImageSearch, bonus_close_variation_5_x, bonus_close_variation_5_y, 368, 44, 474, 417, %bonus_close_variation_5%
		click, %bonus_close_variation_5_x% %bonus_close_variation_5_y%
		sleep, 50
	ImageSearch, bonus_close_variation_6_x, bonus_close_variation_6_y, 368, 44, 474, 417, %bonus_close_variation_6%
		click, %bonus_close_variation_6_x% %bonus_close_variation_6_y%
		sleep, 50
			
	;;activates skill in skill slots as soon as available
	ImageSearch, skill_slot_1_x, skill_slot_1_y, 99, 766, 112, 784, %skill_slot_1%
		click, %skill_slot_1_x% %skill_slot_1_y%
		sleep, 50
	ImageSearch, skill_slot_2_x, skill_slot_2_y, 173, 768, 186, 786, %skill_slot_2%
		click, %skill_slot_2_x% %skill_slot_2_y%
		sleep, 50
	ImageSearch, skill_slot_3_x, skill_slot_3_y, 250, 768, 264, 784, %skill_slot_3%
		click, %skill_slot_3_x% %skill_slot_3_y%
		sleep, 50
	ImageSearch, skill_slot_4_x, skill_slot_4_y, 326, 768, 336, 786, %skill_slot_4%
		click, %skill_slot_4_x% %skill_slot_4_y%
		sleep, 50

	;;added variations to active play robot due to movement around the map
	loop, 5 {
	ImageSearch, bonus_active_play_variation_1_x, bonus_active_play_variation_1_y, 151, 319, 305, 522, %bonus_active_play_variation_1%
		click, %bonus_active_play_variation_1_x% %bonus_active_play_variation_1_y%
		sleep, 50
	ImageSearch, bonus_active_play_variation_2_x, bonus_active_play_variation_2_y, 151, 319, 305, 522, %bonus_active_play_variation_2%
		click, %bonus_active_play_variation_2_x% %bonus_active_play_variation_2_y%
		sleep, 50
	ImageSearch, bonus_active_play_variation_3_x, bonus_active_play_variation_3_y, 151, 319, 305, 522, %bonus_active_play_variation_3%
		click, %bonus_active_play_variation_3_x% %bonus_active_play_variation_3_y%
		sleep, 50
	ImageSearch, bonus_active_play_variation_4_x, bonus_active_play_variation_4_y, 151, 319, 305, 522, %bonus_active_play_variation_4%
		click, %bonus_active_play_variation_4_x% %bonus_active_play_variation_4_y%
		sleep, 50
	ImageSearch, bonus_active_play_variation_5_x, bonus_active_play_variation_5_y, 151, 319, 305, 522, %bonus_active_play_variation_5%
		click, %bonus_active_play_variation_5_x% %bonus_active_play_variation_5_y%
		sleep, 50
	ImageSearch, bonus_active_play_variation_6_x, bonus_active_play_variation_6_y, 151, 319, 305, 522, %bonus_active_play_variation_6%
		click, %bonus_active_play_variation_6_x% %bonus_active_play_variation_6_y%
		sleep, 50
	}
	
	;;this is where the monsters will be levelled up, it'll happen quickly so the 5 second delay at the end won't affect 
	;;the monster reaching their max level before the enemies get too tough
	ImageSearch, button_monster_level_up_upgrade_purchase_minimal_x, button_monster_level_up_upgrade_purchase_minimal_y, 266, 767, 369, 830, %button_monster_level_up_upgrade_purchase_minimal%
	sleep, 100
	click, %monster_position_dps_x% %monster_position_dps_y%
	sleep, 100
	click, %button_monster_level_up_upgrade_purchase_minimal_x% %button_monster_level_up_upgrade_purchase_minimal_y%
	sleep, 100
	click, %monster_position_support_x% %monster_position_support_y%
	sleep, 100
	click, %button_monster_level_up_upgrade_purchase_minimal_x% %button_monster_level_up_upgrade_purchase_minimal_y%
	sleep, 100
	;;makes sure level up bar is gone before searching for map assets	
	ImageSearch, button_monster_level_close_x, button_monster_level_close_y, 420, 761, 490, 829, %button_monster_level_close%
		click, %button_monster_level_close_x% %button_monster_level_close_y%
		sleep, 100
	sleep, 5000 
	;;this 5 second delay is required in order for the imagesearch to detect the death skull enabling prestige,
	;;if it is removed then you'll rarely ever get to prestige once you've reached your max wave
}
