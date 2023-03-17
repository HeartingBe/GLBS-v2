##编辑模式主菜单

# 4 返回主菜单
execute unless data entity @s Items[{Slot:4b}] run data modify entity @s Tags set value ["GLBShop","GLBS0"]
execute unless data entity @s Items[{Slot:4b}] run tellraw @a[distance=..5] [">> \u00a7e已退出编辑模式"]
execute unless data entity @s Items[{Slot:4b}] run data merge entity @s {CustomName:'"\\u00a7f>> \\u00a7bGlobal Shop"',DisplayState:{Name:"minecraft:light_blue_shulker_box"}}

# 10 向出售商店添加商品
execute unless data entity @s Items[{Slot:10b}] run data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit1"]

# 11 从出售商店中删除商品
execute unless data entity @s Items[{Slot:11b}] run data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit2"]

# 12 向回收商店添加商品
execute unless data entity @s Items[{Slot:12b}] run data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit3"]

# 13 从回收商店中删除商品
execute unless data entity @s Items[{Slot:13b}] run data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit4"]

# 14 开关货币转换
execute unless data entity @s Items[{Slot:14b}] run function mny:glbs/minecart/edit/trans_on_off/pre

# 15 编辑货币转换
execute unless data entity @s Items[{Slot:15b}] run data modify entity @s Tags set value ["GLBShop","GLBSedit","GLBSedit_trans"]

# 16 返回主菜单
execute unless data entity @s Items[{Slot:16b}] run data modify entity @s Tags set value ["GLBShop","GLBS0"]
execute unless data entity @s Items[{Slot:16b}] run data merge entity @s {CustomName:'"\\u00a7f>> \\u00a7bGlobal Shop"',DisplayState:{Name:"minecraft:light_blue_shulker_box"}}