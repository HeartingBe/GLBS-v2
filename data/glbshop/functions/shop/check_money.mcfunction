#================搬金钱================
#此时不带有 mny:glbs money_modify:1b 执行函数 glbshop:money 把玩家使用的记分板搬到 GLBSmoney
data remove storage mny:glbs money_modify
function glbshop:money

execute as @a[distance=..5] at @s run tellraw @s [">> ",{"selector":"@s","color":"yellow"}," \u00a7f猫猫~ 你有 ",{"score":{"objective":"GLBSmoney","name":"@s"},"color":"yellow"}," \u00a7f金钱~"]

#修改命令存储 mny:glbs money_modify:1b 执行函数 glbshop:money 把 GLBSmoney 搬到玩家使用的记分板
data modify storage mny:glbs money_modify set value 1b
function glbshop:money
#================搬金钱================

tag @s remove GLBSmodify