##main

##矿车
   execute as @e[type=minecraft:chest_minecart,tag=GLBShop] at @s run function mny:glbs/minecart/pre

##玩家购买 或 取回
execute as @e[type=minecraft:item,tag=!GLBSignore] at @s positioned ~ ~-1.6 ~ run function mny:glbs/item

##翻页
execute as @a[predicate=glbshop:page] at @s run function glbshop:page/page_pre

##查找
execute as @a[predicate=glbshop:check] at @s run function glbshop:page/check_pre