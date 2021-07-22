import os
import random
import re
import time
import pyautogui
import colored
from colored import stylize

image_folder = 'F:\CACHE DRIVE\.Studies\Images\idle_monster_td\\'

icons = {
    # 'boss_rush': image_folder + '',
    'button_prestige': image_folder + 'button_prestige.png',
    'button_prestige_prestige': image_folder + 'button_prestige_prestige.png',
    'map_normal_map_enchanted_forest': image_folder + 'map_normal_map_enchanted_forest.png',
    'button_layout_monster_close': image_folder + 'button_layout_monster_close.png',
    'button_layout_monster': image_folder + 'button_layout_monster.png',
    'button_layout_monster_load': image_folder + 'button_layout_monster_load.png',
    'button_layout_monster_save': image_folder + 'button_layout_monster_save.png',
    'button_layout_monster_close': image_folder + 'button_layout_monster_close.png',
    'button_monster_level_up_upgrade_purchase': image_folder + 'button_monster_level_up_upgrade_purchase.png',
    'button_monster_level_expand': image_folder + 'button_monster_level_expand.png',
    'button_monster_level_close': image_folder + 'button_monster_level_close.png',
    'bonus_drone_swarm': image_folder + 'bonus_drone_swarm.png',
    'bonus_drone_swarm_play': image_folder + 'bonus_drone_swarm_play.png',
    'bonus_cargo_carrier': image_folder + 'bonus_cargo_carrier.png',
    'bonus_cargo_carrier_play': image_folder + 'bonus_cargo_carrier_play.png',
    'button_active_play_close': image_folder + 'button_active_play_close.png'
    # 'drone_swarm_close': image_folder + 'button_prestige',
    # 'cargo_carrier_close': image_folder + 'button_prestige',
    # 'tech_ship': image_folder + 'button_prestige',
    # 'tech_ship_play': image_folder + 'button_prestige',
    # 'tech_ship_close': image_folder + 'button_prestige',
    # 'active_play_close': image_folder + 'button_prestige',
    # 'skill_slot_1': image_folder + 'button_prestige',
    # 'skill_slot_2': image_folder + 'button_prestige',
    # 'skill_slot_3': image_folder + 'button_prestige',
    # 'skill_slot_4': image_folder + 'button_prestige'
}

maps = {
    # 'normal_cursedclouds': image_folder + 'button_prestige',
    # 'normal_beachrun': image_folder + 'button_prestige',
    'normal_enchantedforest': image_folder + 'map_normal_map_enchanted_forest.png',
    # 'normal_snowfall': image_folder + 'button_prestige',
    # 'normal_lavacave': image_folder + 'button_prestige',
    # 'normal_deadwood': image_folder + 'button_prestige',
    'bonus_farming': image_folder + 'map_resource_farm.png',
    # 'bonus_deep_push': image_folder + 'button_prestige'
}


def update_locations():
    for key, value in icons.items():
        if not icons[key].startswith('Box'):
            icons[key] = pyautogui.locateOnScreen(icons[key])
        
    for key, value in maps.items():
        if not maps[key].startswith('Box'):
            maps[key] = pyautogui.locateOnScreen(maps[key])


def level(position, state):
    pass

def bonus(type, state):
    pass

def prestige(state):
    pass

def map(type, location):
    pass


# while True:
update_locations()
for item, coord in icons.items():
    if not coord == None:
        print('[ITEM]', item, '\t', '[COORD]', coord)
for mapss, coord in maps.items():
    if not coord == None:
        print('[MAPSS]', mapss, '\t', '[COORD]', coord)
quit()
