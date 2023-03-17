##货币转换菜单功能

#///warning///#
##如果修改了矿车 -> remove tag GLBSmodify

# 17 返回主菜单
execute unless data entity @s Items[{Slot:17b}] run data modify entity @s Tags set value ["GLBShop","GLBS0"]

# 11 物品 -> 金钱 (不用去除 tag=GLBSmodify 因为界面需要保持,可看作取走玻璃板)
execute unless data entity @s Items[{Slot:11b}] run function mny:glbs/minecart/trans/to_money/pre

# 15 金钱 -> 物品 (不用去除 tag=GLBSmodify 因为界面需要保持,可看作取走玻璃板)
execute unless data entity @s Items[{Slot:15b}] run function mny:glbs/minecart/trans/to_item/pre

##if tag == GLBSmodify -> 玻璃板被取走,保持货币转换菜单
execute if entity @s[tag=GLBSmodify] run data modify entity @s Tags set value ["GLBShop","GLBStrans"]