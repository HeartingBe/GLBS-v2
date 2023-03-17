##仅有一个玩家 -> 通过

#判断金钱是否足够

#此时不带有 mny:glbs money_modify:1b 执行函数 glbshop:money 把玩家使用的记分板搬到 GLBSmoney 
function glbshop:money

#将物品的price标签值存入 #GLBSprice 的 GLBSinfo 记分板
execute store result score #GLBSprice GLBSinfo run data get entity @s Item.tag.glbs.price

#钱不足
   #execute if score @p GLBSmoney < #GLBSprice GLBSinfo as @p run tellraw @s ["\u00a7e\u00a7l[全球商店] \u00a74金钱不足。\u00a7b需要 ",{"score":{"name":"#GLBSprice","objective":"GLBSinfo"},"color":"yellow"}," \u00a7b你的金钱: ",{"score":{"name":"@s","objective":"GLBSmoney"},"color":"yellow"}]
   execute if score @p GLBSmoney < #GLBSprice GLBSinfo as @p run tellraw @s [">> \u00a7c你的金钱只有 ",{"score":{"name":"@s","objective":"GLBSmoney"},"color":"yellow"},"\u00a7c,不能从出售商店中买下这个商品"]
   #音效
   execute if score @p GLBSmoney < #GLBSprice GLBSinfo as @p at @s run playsound minecraft:entity.illusioner.mirror_move player @s ~ ~ ~ 1 1.25

#钱足够
execute if score @p GLBSmoney >= #GLBSprice GLBSinfo run function mny:glbs/sell_op/success

#修改命令存储 mny:glbs money_modify:1b 执行函数 glbshop:money 把 GLBSmoney 搬到玩家使用的记分板
data modify storage mny:glbs money_modify set value 1b
function glbshop:money