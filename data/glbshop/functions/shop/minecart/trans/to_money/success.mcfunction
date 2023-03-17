#物品足够 扣除 增加金钱

execute as @p[distance=..5] at @s run playsound minecraft:entity.villager.yes player @s ~ ~ ~ 1 1
tellraw @p[distance=..5] [">> 成功兑换,获得 ",{"score":{"objective":"GLBSinfo","name":"#GLBStrans_money"},"color":"yellow"}," \u00a7f金钱"]

#================增加金钱================
#此时不带有 mny:glbs money_modify:1b 执行函数 glbshop:money 把玩家使用的记分板搬到 GLBSmoney
data remove storage mny:glbs money_modify
function glbshop:money
scoreboard players operation @p[distance=..5] GLBSmoney += #GLBStrans_money GLBSinfo
#修改命令存储 mny:glbs money_modify:1b 执行函数 glbshop:money 把 GLBSmoney 搬到玩家使用的记分板
data modify storage mny:glbs money_modify set value 1b
function glbshop:money
#================增加金钱================

#如果 copy3 有 2 个元素,直接扣除第一个所对应的背包格子(函数会调用自身) 可以和回收商店共用该函数
execute if data storage mny:glbs copy3[1] run function mny:glbs/buy_op/buy/success/delete_all

#剩最后一个元素 可以和回收商店共用该函数
function mny:glbs/buy_op/buy/success/delete_last