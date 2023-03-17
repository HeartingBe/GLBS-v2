##编辑货币转换

#↑
execute unless data entity @s Items[{Slot:0b}] run function mny:glbs/minecart/edit/trans/add/wan
execute unless data entity @s Items[{Slot:1b}] run function mny:glbs/minecart/edit/trans/add/qian
execute unless data entity @s Items[{Slot:2b}] run function mny:glbs/minecart/edit/trans/add/bai
execute unless data entity @s Items[{Slot:3b}] run function mny:glbs/minecart/edit/trans/add/shi
execute unless data entity @s Items[{Slot:4b}] run function mny:glbs/minecart/edit/trans/add/ge

#↓
execute unless data entity @s Items[{Slot:18b}] run function mny:glbs/minecart/edit/trans/div/wan
execute unless data entity @s Items[{Slot:19b}] run function mny:glbs/minecart/edit/trans/div/qian
execute unless data entity @s Items[{Slot:20b}] run function mny:glbs/minecart/edit/trans/div/bai
execute unless data entity @s Items[{Slot:21b}] run function mny:glbs/minecart/edit/trans/div/shi
execute unless data entity @s Items[{Slot:22b}] run function mny:glbs/minecart/edit/trans/div/ge

# 17 返回编辑模式主菜单
execute unless data entity @s Items[{Slot:17b}] run data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit0"]

# 26 确认
execute unless data entity @s Items[{Slot:26b}] run function mny:glbs/minecart/edit/trans/ok_pre

# 8 重置位数
execute unless data entity @s Items[{Slot:8b}] run function mny:glbs/minecart/edit/trans/ok_reset

tag @s remove GLBSmodify