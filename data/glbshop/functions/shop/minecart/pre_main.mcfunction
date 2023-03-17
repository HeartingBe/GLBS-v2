# 10 作者信息
execute unless data entity @s Items[{Slot:10b}] run function mny:glbs/minecart/author

# 12 世界商店
execute unless data entity @s Items[{Slot:12b}] run data modify entity @s Tags set value ["GLBShop","GLBS1"]

# 13 出售商店
execute unless data entity @s Items[{Slot:13b}] run data modify entity @s Tags set value ["GLBShop","GLBSsell"]

# 14 回收商店
execute unless data entity @s Items[{Slot:14b}] run data modify entity @s Tags set value ["GLBShop","GLBSbuy"]

# 4 编辑模式
execute unless data entity @s Items[{Slot:4b}] run function mny:glbs/minecart/enter_edit_if

# 22 货币转换
execute unless data entity @s Items[{Slot:22b}] run function mny:glbs/minecart/enter_trans_if

# 16 关闭商店
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:16b}] run function mny:glbs/minecart/close