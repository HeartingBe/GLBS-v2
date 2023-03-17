#更新货币转换菜单

#loot -> 填入
#execute as @p run loot replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.0 loot glbshop:trans

#修改 Slot:15b
#data modify storage mny:glbs modify set from storage mny:glbs trans_item
#execute store result storage mny:glbs modify.Count byte 1 run scoreboard players get #GLBStrans_num GLBSinfo
#data modify storage mny:glbs modify.Slot set value 15b
#data modify entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] Items[{Slot:15b}] set from storage mny:glbs modify

#改为直接写入列表
data modify entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] Items set from storage mny:glbs trans