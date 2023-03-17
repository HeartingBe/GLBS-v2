##由矿车执行 玩家金钱 -> 物品

#判断周围是不是有多于1个的玩家
   #统计周围一定距离内的玩家数量 结果存储在记分板 #GLBS_too_many_players GLBSinfo
   execute store result score #GLBS_too_many_players GLBSinfo if entity @a[distance=..7]

   #玩家太多
   execute if score #GLBS_too_many_players GLBSinfo matches 2.. run tellraw @a[distance=..5] [">> \u00a7c兑换物品失败,你周围有其他玩家"]

   #通过
   execute if score #GLBS_too_many_players GLBSinfo matches 1 run function mny:glbs/minecart/trans/to_item/pre_true