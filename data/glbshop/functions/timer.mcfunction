## 每过 1d 时长，所有商品售货架剩余时间减少 1d，由前置函数 timer_pre 调用

#重置命令存储 mny:glbs copy
#data remove storage mny:glbs copy

#把列表 mny:glbs shop 复制到列表 mny:glbs copy
data modify storage mny:glbs copy set from storage mny:glbs shop

#删除列表 mny:glbs shop
data remove storage mny:glbs shop

#生成辅助盔甲架 携带标签GLBSLore
execute as @r at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["GLBSLore"]}
execute unless entity @a as @e[limit=1,sort=nearest] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["GLBSLore"]}

#统计本次退回多少个物品 结果存储在记分板 #GLBSback_store GLBSinfo 先重置
scoreboard players set #GLBSback_store GLBSinfo 0

#执行函数 glbshop:timer/pre 分离物品
execute if data storage mny:glbs copy[0] run function glbshop:timer/pre

#如果列表 mny:glbs back_pre 有元素 在 2t 后执行函数 glbshop:back/pre 把待退回的物品写入列表 mny:glbs back 对应uid玩家的元素的entries中
execute if data storage mny:glbs back_pre[0] run schedule function glbshop:back/pre 2t append

#通知
execute unless score #GLBSback_store GLBSinfo matches 0 run tellraw @a [">> 下架了 ",{"score":{"name":"#GLBSback_store","objective":"GLBSinfo"},"color":"yellow"}," \u00a7f个过期商品"]

#清除盔甲架
kill @e[type=minecraft:armor_stand,tag=GLBSLore]