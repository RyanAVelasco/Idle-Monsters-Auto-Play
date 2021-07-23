#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Pixel, Relative

PgUp & PgDn::reload
Pause::pause

[::
mouseGetPos, x, Y
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

BlockInput, On
BlockInput, SendAndMouse
BlockInput, MouseMove

; image location variable
; F:\CACHE DRIVE\.Studies\Images\idle_monster_td\
image_folder = F:\CACHE DRIVE\.Studies\Images\idle_monster_td\ ; if images not in same folder then replace this with image location minus filename
;onscreen variables
; boss_rush = %image_folder%
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
bonus_drone_swarm = %image_folder%bonus_drone_swarm.png
bonus_drone_swarm_play = %image_folder%bonus_drone_swarm_play.png
bonus_cargo_carrier = %image_folder%bonus_cargo_carrier.png
bonus_cargo_carrier_play = %image_folder%bonus_cargo_carrier_play.png
butto0n_active_play_close = %image_folder%button_active_play_close.png
bonus_tech_ship = %image_folder%bonus_tech_ship.png
bonus_tech_ship_play = %image_folder%bonus_tech_ship_play.png
button_active_play_close = %image_folder%button_active_play_close.png
drone_swarm_close = %image_folder%button_prestige
cargo_carrier_close = %image_folder%button_prestige
tech_ship_close = %image_folder%button_prestige
skill_slot_1 = %image_folder%button_prestige
skill_slot_2 = %image_folder%button_prestige
skill_slot_3 = %image_folder%button_prestige
skill_slot_4 = %image_folder%button_prestige
misc_death_skull = %image_folder%misc_death_skull.png
;maps variables
map_normal_map_cursed_clouds_asset = %image_folder%map_normal_map_cursed_clouds_asset.png
map_normal_map_beach_run_asset = %image_folder%map_normal_map_beach_run_asset.png
map_normal_map_enchanted_forest_asset = %image_folder%map_normal_map_enchanted_forest_asset.png
map_normal_snowfall_asset = %image_folder%map_normal_snowfall_asset.png
map_normal_map_lava_cave_asset = %image_folder%map_normal_map_lava_cave_asset.png
map_normal_map_deadwood_asset = %image_folder%map_normal_map_deadwood_asset.png
map_resource_farm_asset = %image_folder%map_resource_farm_asset.png
map_bonus_deep_pus_asseth = %image_folder%map_bonus_deep_pus_asseth.png

;; Main code begins here
while True {
	;; in case the window somehow goes to the background - it's happened to me somehow
	if not WinActive("IdlesMonsterTD")
		WinActivate, IdleMonsterTD
		MouseMove, 100, 100

	;; find present ui elements and assign them to x, y position variables
	;onscreen elements
	ImageSearch, drone_swarm_x, drone_swarm_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_monster_level_up_upgrade_purchase_minimal%
	ImageSearch, boss_rush_x, boss_rush_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %boss_rush%
	ImageSearch, map_normal_map_enchanted_forest_x, map_normal_map_enchanted_forest_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_normal_map_enchanted_forest%
	ImageSearch, button_layout_monster_close_x, button_layout_monster_close_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_layout_monster_close%
	ImageSearch, button_layout_monster_x, button_layout_monster_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_layout_monster%
	ImageSearch, button_layout_monster_load_x, button_layout_monster_load_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_layout_monster_load%
	ImageSearch, button_layout_monster_save_x, button_layout_monster_save_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_layout_monster_save%
	ImageSearch, image_folder_x, image_folder_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_layout_monster_close%
	ImageSearch, button_monster_level_up_upgrade_purchase_minimal_x, button_monster_level_up_upgrade_purchase_minimal_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_monster_level_up_upgrade_purchase_minimal%
	ImageSearch, button_monster_level_up_upgrade_purchase_minimal_inactive_x, button_monster_level_up_upgrade_purchase_minimal_inactive_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_monster_level_up_upgrade_purchase_minimal_inactive%
	ImageSearch, button_monster_level_expand_x, button_monster_level_expand_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_monster_level_expand%
	ImageSearch, button_monster_level_collapse_x, button_monster_level_collapse_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_monster_level_collapse%
	ImageSearch, button_monster_level_close_x, button_monster_level_close_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_monster_level_close%
	ImageSearch, bonus_drone_swarm_x, bonus_drone_swarm_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %bonus_drone_swarm%
		click, %bonus_drone_swarm_x% %bonus_drone_swarm_y%
		sleep, 50
	ImageSearch, bonus_drone_swarm_play_x, bonus_drone_swarm_play_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %bonus_drone_swarm_play%
		click, %bonus_drone_swarm_play_x% %bonus_drone_swarm_play_y%
		sleep, 50
	ImageSearch, bonus_cargo_carrier_x, bonus_cargo_carrier_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %bonus_cargo_carrier%
	ImageSearch, bonus_cargo_carrier_play_x, bonus_cargo_carrier_play_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %bonus_cargo_carrier_play%
	ImageSearch, button_active_play_close_x, button_active_play_close_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_active_play_close%
		click, %button_active_play_close_x% %button_active_play_close_y%
		sleep, 50
	ImageSearch, bonus_tech_ship_x, bonus_tech_ship_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %bonus_tech_ship%
	ImageSearch, bonus_tech_ship_play_x, bonus_tech_ship_play_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %bonus_tech_ship_play%
	ImageSearch, button_active_play_close_x, button_active_play_close_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_active_play_close%
	ImageSearch, drone_swarm_close_x, drone_swarm_close_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %drone_swarm_close%
	ImageSearch, cargo_carrier_close_x, cargo_carrier_close_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %cargo_carrier_close%
	ImageSearch, tech_ship_close_x, tech_ship_close_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %tech_ship_close%
	ImageSearch, skill_slot_1_x, skill_slot_1_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %skill_slot_1%
	ImageSearch, skill_slot_2_x, skill_slot_2_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %skill_slot_2%
	ImageSearch, skill_slot_3_x, skill_slot_3_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %skill_slot_3%
	ImageSearch, skill_slot_4_x, skill_slot_4_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %skill_slot_4%
	ImageSearch, death_x, death_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %misc_death_skull%
	; if (errorlevel=0) { ; DEBUG: STAYS COMMENTED UNTIL ALL MAPS HAVE MONSTER LOCATION VARIABLES
	; 	sleep, 10500
	; 	ImageSearch, button_prestige_x, button_prestige_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_prestige%
	; 	click, %button_prestige_x% %button_prestige_y%
	; 	sleep, 250
	; 	ImageSearch, button_prestige_prestige_x, button_prestige_prestige_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_prestige_prestige%
	; 	click, %button_prestige_prestige_x% %button_prestige_prestige_y%
	; 	sleep, 250
	; 	ImageSearch, button_prestige_prestige_lets_go_x, button_prestige_prestige_lets_go_y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button_prestige_prestige_lets_go%
	; 	click, %button_prestige_prestige_lets_go_x% %button_prestige_prestige_lets_go_y%
	; 	sleep, 10000
	; 	click, %button_layout_monster_x% %button_layout_monster_y%
	; 	sleep, 250
	; 	click, %button_layout_monster_load_x% %button_layout_monster_load_x%
	; }
	;maps & unique asset ;asssign monster coords	
	ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_normal_map_cursed_clouds_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 159, monster_position_dps_y = 204
		monster_position_support_x = 211, monster_position_support_y = 503
	}
	ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_normal_map_beach_run_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 179, monster_position_dps_y = 528
		monster_position_support_x = 316, monster_position_support_y = 287
	}
	ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_normal_map_enchanted_forest_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 210, monster_position_dps_y = 474
		monster_position_support_x = 314, monster_position_support_y = 643
	}
	ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_normal_snowfall_asset%
	if (errorlevel=0) {
		monster_position_dps_x = 179, monster_position_dps_y = 451
		monster_position_support_x = 311, monster_position_support_y = 453
	}
	; ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_normal_map_lava_cave_asset%
	; if (errorlevel=0) {
	; 	monster_position_dps_x = 159
	; 	monster_position_dps_y = 204
	; 	monster_position_support_x = 211
	; 	monster_position_support_y = 503
	; }
	; ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_normal_map_deadwood_asset%
	; if (errorlevel=0) {
	; 	monster_position_dps_x = 159
	; 	monster_position_dps_y = 204
	; 	monster_position_support_x = 211
	; 	monster_position_support_y = 503
	; }
	; ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_resource_farm_asset%
	; if (errorlevel=0) {
	; 	monster_position_dps_x = 159
	; 	monster_position_dps_y = 204
	; 	monster_position_support_x = 211
	; 	monster_position_support_y = 503
	; }
	; ImageSearch, x, y, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %map_bonus_deep_push_asset%
	; if (errorlevel=0) {
	; 	monster_position_dps_x = 159
	; 	monster_position_dps_y = 204
	; 	monster_position_support_x = 211
	; 	monster_position_support_y = 503
	; }
	
	; if button_monster_level_collapse_x >= 0 && button_monster_level_collapse_y >= 0:
	; 	click, %button_monster_level_collapse_x%, %button_monster_level_collapse_y%
	Random, x, 89, 406
	Random, y, 320, 403
	click, %x%, %y%
	sleep, 50
	click, %monster_position_dps_x% %monster_position_dps_y%
	sleep, 50
	click, %button_monster_level_up_upgrade_purchase_minimal_x% %button_monster_level_up_upgrade_purchase_minimal_y%
	sleep, 50
	click, %monster_position_support_x% %monster_position_support_y%
	sleep, 50
	click, %button_monster_level_up_upgrade_purchase_minimal_x% %button_monster_level_up_upgrade_purchase_minimal_y%	
	sleep, 50
	click, 435, 306 ; USED UNTIL IMAGESEARCH..ACTIVEPLAY CLOSE CODED
	; sleep, 5000
}
