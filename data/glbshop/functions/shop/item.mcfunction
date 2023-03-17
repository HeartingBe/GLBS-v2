##由物品执行

execute if data entity @s Item.tag.glbs.sell run function mny:glbs/buy/pre
execute if data entity @s Item.tag.glbs.back run function mny:glbs/back/pre
execute if data entity @s Item.tag.glbs.sell_op run function mny:glbs/sell_op/pre
execute if data entity @s Item.tag.glbs.buy_op run function mny:glbs/buy_op/pre

tag @s add GLBSignore