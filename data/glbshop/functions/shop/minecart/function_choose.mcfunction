##矿车格数 ≤ 26 -> add tag GLBSmodify
##based on tag GLBS?

##add tag GLBSmodify 保持至矿车被修改
tag @s add GLBSmodify

##switch(GLBS?)
   ##case 0 -> 主菜单
   execute if entity @s[tag=GLBS0] run function mny:glbs/minecart/pre_main

   ##case 1 -> 世界商店菜单
   execute if entity @s[tag=GLBSmodify,tag=GLBS1] run function mny:glbs/minecart/main

   ##case trans -> 货币转换
   execute if entity @s[tag=GLBSmodify,tag=GLBStrans] run function mny:glbs/minecart/trans

   ##default
   ##sell -> 出售商店
   execute if entity @s[tag=GLBSmodify,tag=GLBSsell] run function mny:glbs/minecart/default
   ##buy -> 回收商店
   execute if entity @s[tag=GLBSmodify,tag=GLBSbuy] run function mny:glbs/minecart/default
   ##2 -> 售货架
   execute if entity @s[tag=GLBSmodify,tag=GLBS2] run function mny:glbs/minecart/default
   ##3 -> 玩家查询自身正在出售的物品
   ##由于过程相同,和 3 4 5 6 共用一个函数
   execute if entity @s[tag=GLBSmodify,tag=GLBS3] run function mny:glbs/minecart/default
   ##4 -> 玩家正在查看被退回的物品
   execute if entity @s[tag=GLBSmodify,tag=GLBS4] run function mny:glbs/minecart/default
   ##5 -> 玩家正在查询自身历史购买的物品
   execute if entity @s[tag=GLBSmodify,tag=GLBS5] run function mny:glbs/minecart/default
   ##6 -> 玩家正在查询自身历史出售的物品
   execute if entity @s[tag=GLBSmodify,tag=GLBS6] run function mny:glbs/minecart/default

#清除内容物
data remove entity @s Items

##防止意外情况 最后均 remove tag GLBSmodify
tag @s remove GLBSmodify

##完成上述操作 -> 更新矿车内容物
execute unless entity @s[tag=GLBSdie] run function mny:glbs/minecart/modify/pre