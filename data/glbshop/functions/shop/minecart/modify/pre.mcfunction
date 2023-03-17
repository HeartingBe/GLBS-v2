##矿车更新内容物

##particle
#particle minecraft:happy_villager ~ ~1 ~ 0.25 0.25 0.25 1 10 normal

##sound
playsound minecraft:ui.button.click player @p ~ ~ ~ 1 1

#非编辑模式
execute if entity @s[tag=!GLBSedit] run function mny:glbs/minecart/modify/pre_no_edit
#编辑模式
execute if entity @s[tag=GLBSedit] run function mny:glbs/minecart/modify/pre_edit