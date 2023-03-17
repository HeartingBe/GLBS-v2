#///warning///#
##如果修改了矿车 -> remove tag GLBSmodify

# 8 上一页
execute unless data entity @s Items[{Slot:8b}] run function mny:glbs/minecart/up

# 26 下一页
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:26b}] run function mny:glbs/minecart/down

# 17 返回编辑模式主菜单
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:17b}] run data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit0"]

##if tag == GLBSmodify -> 其余格子被取走,只需等待填充
tag @s remove GLBSmodify