##向回收商店添加商品

#↑ 和出售商店共用
execute unless data entity @s Items[{Slot:3b}] run function mny:glbs/minecart/edit/sell_add/add/wan
execute unless data entity @s Items[{Slot:4b}] run function mny:glbs/minecart/edit/sell_add/add/qian
execute unless data entity @s Items[{Slot:5b}] run function mny:glbs/minecart/edit/sell_add/add/bai
execute unless data entity @s Items[{Slot:6b}] run function mny:glbs/minecart/edit/sell_add/add/shi
execute unless data entity @s Items[{Slot:7b}] run function mny:glbs/minecart/edit/sell_add/add/ge

#↓ 和出售商店共用
execute unless data entity @s Items[{Slot:21b}] run function mny:glbs/minecart/edit/sell_add/div/wan
execute unless data entity @s Items[{Slot:22b}] run function mny:glbs/minecart/edit/sell_add/div/qian
execute unless data entity @s Items[{Slot:23b}] run function mny:glbs/minecart/edit/sell_add/div/bai
execute unless data entity @s Items[{Slot:24b}] run function mny:glbs/minecart/edit/sell_add/div/shi
execute unless data entity @s Items[{Slot:25b}] run function mny:glbs/minecart/edit/sell_add/div/ge

# 17 返回编辑模式主菜单
execute unless data entity @s Items[{Slot:17b}] run data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit0"]

# 26 确认
execute unless data entity @s Items[{Slot:26b}] run function mny:glbs/minecart/edit/buy_add/ok_pre

# 8 重置位数 和出售商店共用
execute unless data entity @s Items[{Slot:8b}] run function mny:glbs/minecart/edit/sell_add/ok_reset

tag @s remove GLBSmodify