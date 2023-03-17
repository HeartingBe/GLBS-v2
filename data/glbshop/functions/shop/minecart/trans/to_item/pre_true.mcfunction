#判断金钱是否足够

#此时不带有 mny:glbs money_modify:1b 执行函数 glbshop:money 把玩家使用的记分板搬到 GLBSmoney 
function glbshop:money


#钱不足
   execute if score @p GLBSmoney < #GLBStrans_money GLBSinfo as @p run tellraw @s [">> \u00a7c你的金钱只有 ",{"score":{"name":"@s","objective":"GLBSmoney"},"color":"yellow"},"\u00a7c,不足以兑换物品"]
   #音效
   execute if score @p GLBSmoney < #GLBStrans_money GLBSinfo as @p at @s run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1 1

#钱足够
execute if score @p GLBSmoney >= #GLBStrans_money GLBSinfo run function mny:glbs/minecart/trans/to_item/success

#修改命令存储 mny:glbs money_modify:1b 执行函数 glbshop:money 把 GLBSmoney 搬到玩家使用的记分板
data modify storage mny:glbs money_modify set value 1b
function glbshop:money