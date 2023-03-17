#上架冷却
scoreboard players remove @a[scores={GLBStimer=1..}] GLBStimer 1
scoreboard players reset @a[scores={GLBStimer=0}] GLBStimer

#动态检测
execute if score #GLBStimer_stop_minecart GLBSinfo matches 1.. run scoreboard players remove #GLBStimer_stop_minecart GLBSinfo 1
execute if score #GLBStimer_stop_minecart GLBSinfo matches 0 unless entity @e[type=minecraft:chest_minecart,tag=GLBShop] run function glbshop:stop_minecart

#赋修改权限
scoreboard players enable @a GLBSpage_shop
scoreboard players enable @a GLBSpage_issell
scoreboard players enable @a GLBSpage_bought
scoreboard players enable @a GLBSpage_sold
scoreboard players enable @a GLBScheck_shop
scoreboard players enable @a GLBScheck_bought
scoreboard players enable @a GLBScheck_sold

#矿车5格内无玩家
execute as @e[type=minecraft:chest_minecart,tag=GLBShop] at @s unless entity @a[distance=..5] run function glbshop:kill_minecart

#data storage -> delete -> 减少内存
data remove storage mny:glbs copy
data remove storage mny:glbs copy2
data remove storage mny:glbs copy3
data remove storage mny:glbs modify

schedule function glbshop:1s 1s append