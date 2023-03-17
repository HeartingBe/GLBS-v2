## tick

##赋权限 TODO 优化为触发式+间隔修正
   ##召矿车
   scoreboard players enable @a GLBS
   ##上架
   scoreboard players enable @a GLBSsell

##uid TODO 优化为触发式，第一次使用商店时触发分配uid
execute as @a unless score @s GLBSuid matches 1.. run function glbshop:uid

##玩家上架物品
execute as @a[scores={GLBSsell=1..}] at @s run function mny:glbs/sell/test

##unless data mny:glbs stop_minecart -> main
execute unless data storage mny:glbs stop_minecart run function glbshop:main

##不合法行为
   ##清除玩家背包商店物品
   execute as @a run function glbshop:clear
   ##清除掉落物商店物品
   kill @e[type=minecraft:item,nbt={Item:{tag:{glbs:{shop:1b}}}}]
   ##矿车周围有漏斗和漏斗矿车
   execute as @e[type=minecraft:chest_minecart,tag=GLBShop] at @s run function mny:glbs/if_hopper_minecart

##其他触发
execute as @a[scores={GLBS=1..}] at @s rotated ~ 0 positioned ^ ^ ^0.5 run function mny:glbs/test