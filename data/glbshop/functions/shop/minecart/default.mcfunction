##GLBS? default

#///warning///#
##如果修改了矿车 -> remove tag GLBSmodify

# 8 上一页
execute unless data entity @s Items[{Slot:8b}] run function mny:glbs/minecart/up

# 26 下一页
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:26b}] run function mny:glbs/minecart/down

# 17 返回世界商店主菜单
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:17b}] if entity @s[tag=!GLBSsell,tag=!GLBSbuy] run data modify entity @s Tags set value ["GLBShop","GLBS1"]

# 17 返回主菜单
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:17b}] unless entity @s[tag=!GLBSsell,tag=!GLBSbuy] run data modify entity @s Tags set value ["GLBShop","GLBS0"]

##if tag == GLBSmodify -> 其余格子被取走,只需等待填充
tag @s remove GLBSmodify