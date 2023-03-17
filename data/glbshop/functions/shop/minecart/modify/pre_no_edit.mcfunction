##particle
#particle minecraft:happy_villager ~ ~1 ~ 0.25 0.25 0.25 1 10 normal

##sound
#playsound minecraft:ui.button.click player @p ~ ~ ~ 1 1

##sell -> 出售商店
execute if entity @s[tag=GLBSsell] run function mny:glbs/minecart/modify/sell

##buy -> 回收商店
execute if entity @s[tag=GLBSbuy] run function mny:glbs/minecart/modify/buy

##trans -> 货币转换
execute if entity @s[tag=GLBStrans] run function mny:glbs/minecart/modify/trans

##0 -> 主菜单
execute if entity @s[tag=GLBS0] run function mny:glbs/minecart/modify/pre_main

##1 -> 世界商店菜单
execute if entity @s[tag=GLBS1] run function mny:glbs/minecart/modify/main

##2 -> 售货架
execute if entity @s[tag=GLBS2] run function mny:glbs/minecart/modify/shop

##3 -> 玩家查询自己正在出售的物品
execute if entity @s[tag=GLBS3] run function mny:glbs/minecart/modify/issell

##4 -> 玩家查询自己被退回的物品
execute if entity @s[tag=GLBS4] run function mny:glbs/minecart/modify/back

##5 -> 玩家查询其历史购买的物品
execute if entity @s[tag=GLBS5] run function mny:glbs/minecart/modify/bought

##6 -> 玩家查询其历史售出的物品
execute if entity @s[tag=GLBS6] run function mny:glbs/minecart/modify/sold