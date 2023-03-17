#玩家钱足够 成功兑换物品

#扣除钱
scoreboard players operation @p GLBSmoney -= #GLBStrans_money GLBSinfo

#通知
tellraw @p[distance=..5] [">> 成功兑换,获得 ",{"score":{"objective":"GLBSinfo","name":"#GLBStrans_num"},"color":"yellow"}," \u00a7f个物品"]
execute as @p[distance=..5] at @s run playsound minecraft:entity.villager.yes player @s ~ ~ ~ 1 1

#data mny:glbs trans_item >>copy>> mny:glbs modify
data modify storage mny:glbs modify set from storage mny:glbs trans_item

#生成石头 携带标签GLBSitem
execute as @p[distance=..5] at @s run summon minecraft:item ~ ~ ~ {Tags:["GLBSitem"],PickupDelay:0s,Invulnerable:1b,Item:{id:"minecraft:stone",Count:1b}}
   #规定可以捡起的玩家
   data modify entity @e[type=minecraft:item,tag=GLBSitem,limit=1] Owner set from entity @p[distance=..5] UUID
   #写入 Count
   execute store result storage mny:glbs modify.Count byte 1 run scoreboard players get #GLBStrans_num GLBSinfo
   #更改物品信息
   data modify entity @e[type=minecraft:item,tag=GLBSitem,limit=1] Item set from storage mny:glbs modify
#去除标签GLBSitem
tag @e[type=minecraft:item,tag=GLBSitem] remove GLBSitem