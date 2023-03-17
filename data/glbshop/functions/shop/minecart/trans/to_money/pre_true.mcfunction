#data mny:glbs trans_item >>copy>> data mny:glbs modify
data modify storage mny:glbs modify set from storage mny:glbs trans_item

#get Count -> score #GLBStemp_count GLBSinfo
scoreboard players operation #GLBStemp_count GLBSinfo = #GLBStrans_num GLBSinfo

#get price -> score #GLBStemp_price GLBSinfo
scoreboard players operation #GLBStemp_price GLBSinfo = #GLBStrans_money GLBSinfo

#Inventory >>copy>> data mny:glbs copy
data modify storage mny:glbs copy set from entity @p[distance=..5] Inventory

#add count(base on Inventory) 可以和回收商店共用该函数
function mny:glbs/buy_op/buy/add_count

#变量 #GLBStemp? 均可以使用

#如果 #GLBStemp_count_inventory GLBSinfo < #GLBStemp_count GLBSinfo 不足
execute if score #GLBStemp_count_inventory GLBSinfo < #GLBStemp_count GLBSinfo run tellraw @p[distance=..5] [">> \u00a7c你只有 ",{"score":{"objective":"GLBSinfo","name":"#GLBStemp_count_inventory"}}," \u00a7c个物品,不足以兑换金钱"]
execute if score #GLBStemp_count_inventory GLBSinfo < #GLBStemp_count GLBSinfo as @p[distance=..5] at @s run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1 1

execute if score #GLBStemp_count_inventory GLBSinfo >= #GLBStemp_count GLBSinfo run function mny:glbs/minecart/trans/to_money/success