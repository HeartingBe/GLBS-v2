##玩家 GLBS 触发

##if GLBS == 1 -> 召唤商店
   ##周围有漏斗 -> false
   execute if score @s GLBS matches 1 run function mny:glbs/if_hopper
   execute if score @s GLBS matches 1 if entity @s[tag=!GLBSno_hopper] run function mny:glbs/no_hopper
   ##7格内已有商店 -> false
   execute if score @s GLBS matches 1 unless block ~ ~-1 ~ minecraft:hopper if entity @e[type=minecraft:chest_minecart,tag=GLBShop,distance=..7] run function mny:glbs/no_entity
   ##true
   execute if score @s GLBS matches 1 if entity @s[tag=GLBSno_hopper] unless entity @e[type=minecraft:chest_minecart,tag=GLBShop,distance=..7] run function mny:glbs/success_summon

## --

##reset GLBS
scoreboard players reset @s GLBS

##reset tag no_hopper
tag @s remove GLBSno_hopper