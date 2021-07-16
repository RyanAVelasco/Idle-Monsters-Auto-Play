import colored
from colored import stylize
import random
import os
import pyautogui
import time
from win32gui import GetWindowText, GetForegroundWindow

while True:
    if GetWindowText(GetForegroundWindow()) == 'IdleMonsterTD':
        break


image_folder = 'F:\CACHE DRIVE\.Studies\Images\idle_monster_td\\'

images = {
    # Left Siderbar
    'bonus_drone_swarm': image_folder + 'bonus_drone_swarm.png',
    'bonus_cargo_carrier': image_folder + 'bonus_cargo_carrier.png',
    'bonus_prestige': image_folder + 'bonus_prestige.png',
    # Menu
    'menu_challenges': image_folder + 'menu_challenges.png',
    'menu_collections': image_folder + 'menu_collections.png',
    'menu_leaderboards': image_folder + 'menu_leaderboards.png',
    'menu_monster': image_folder + 'menu_monster.png',
    'menu_premium_shop': image_folder + 'menu_premium_shop.png',
    'menu_settings': image_folder + 'menu_settings.png',
    'menu_upgrades': image_folder + 'menu_upgrades.png',
    # Menu: Monster
    'menu_monster_icon': image_folder + 'menu_monster_icon.png',
    'menu_monster_deck_advanced': image_folder + 'menu_monster_deck_advanced.png',
    'menu_monster_deck_beginner': image_folder + 'menu_monster_deck_beginner.png',
    'menu_monster_deck_eternal': image_folder + 'menu_monster_deck_eternal.png',
    'menu_monster_deck_expert': image_folder + 'menu_monster_deck_expert.png',
    'menu_monster_deck_grand_master': image_folder + 'menu_monster_deck_grand_master.png',
    'menu_monster_deck_master': image_folder + 'menu_monster_deck_master.png',
    'menu_monster_deck_regular': image_folder + 'menu_monster_deck_regular.png',
    #Menu: Upgrades
    'menu_upgrades_spells_autocast_spells_autocast_amount': image_folder + 'menu_upgrades_spells_autocast_spells_autocast_amount.png',
    'menu_upgrades_spells_autocast_spells_autocast_timer': image_folder + 'menu_upgrades_spells_autocast_spells_autocast_timer.png',
    'menu_upgrades_spells_deadly_strike': image_folder + 'menu_upgrades_spells_deadly_strike.png',
    'menu_upgrades_spells_death_awaits': image_folder + 'menu_upgrades_spells_death_awaits.png',
    'menu_upgrades_spells_emp': image_folder + 'menu_upgrades_spells_emp.png',
    'menu_upgrades_spells_essence_storm': image_folder + 'menu_upgrades_spells_essence_storm.png',
    'menu_upgrades_spells_freeze': image_folder + 'menu_upgrades_spells_freeze.png',
    'menu_upgrades_spells_frenzy_aura': image_folder + 'menu_upgrades_spells_frenzy_aura.png',
    'menu_upgrades_spells_heavy_weapons': image_folder + 'menu_upgrades_spells_heavy_weapons.png',
    'menu_upgrades_spells_mastership': image_folder + 'menu_upgrades_spells_mastership.png',
    'menu_upgrades_spells_prosper': image_folder + 'menu_upgrades_spells_prosper.png',
    'menu_upgrades_spells_rain_of_fire': image_folder + 'menu_upgrades_spells_rain_of_fire.png',
    'menu_upgrades_spells_strength_aura': image_folder + 'menu_upgrades_spells_strength_aura.png',
    'menu_upgrades_spells_time_warp': image_folder + 'menu_upgrades_spells_time_warp.png',
    #UI Menu Bar
    'menu_bar_notification_icon': image_folder + 'menu_bar_notification_icon.png',
    'skill_bar_frame': image_folder + 'skill_bar_frame.png',
    #skill bar
    # Misc
    'game_over_skull': image_folder + 'game_over_skull.png',
    'popup_play': image_folder + 'popup_play.png',
    'popup_prestige': image_folder + 'popup_prestige.png',
    'popup_close_menu': image_folder + 'popup_close_menu.png',
    'popup_close_bonus': image_folder + 'popup_close_bonus.png',
    'popup_close_prestige': image_folder + 'popup_close_prestige.png'
}

constant_variables = ''

def skills(skillbar1, skillbar2, skillbar3, skillbar4):
    pass

def sidebar_bonus(drone_swarm, cargo_carrier, tech_ship):
    pass

def prestige():
    pass

def monsters(deck):
    pass

def upgrade(type):
    pass

# below is the code to check if images are present on screen and returns coordinates of those found
while True:
    for key, value in images.items(): 
        if GetWindowText(GetForegroundWindow()) == 'IdleMonsterTD' and pyautogui.locateOnScreen(images[key]) != None:
            print('[ Found ] ', key, pyautogui.locateOnScreen(images[key]))
            # a, b, c, d = pyautogui.locateOnScreen(images[key])
            # print(key, '-', pyautogui.locateOnScreen(images[key])) # prints location of image before clicking in next line
            # pyautogui.click(pyautogui.locateOnScreen(images[key])) # clicks center of found image
        else:
            time.sleep(1)
# above is the code to check if images are present on screen and returns coordinates of those foundimport colored


##### main code #####









