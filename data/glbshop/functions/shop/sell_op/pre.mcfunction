##由出售商店物品执行该函数

##判断模式
#非编辑
execute unless entity @e[type=minecraft:chest_minecart,distance=..5,tag=GLBSedit] run function mny:glbs/sell_op/pre_no_edit
#编辑
execute if entity @e[type=minecraft:chest_minecart,distance=..5,tag=GLBSedit] run function mny:glbs/sell_op/pre_edit