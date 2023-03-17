##世界商店菜单功能

#///warning///#
##如果修改了矿车 -> remove tag GLBSmodify

# 4 查看金钱
execute unless data entity @s Items[{Slot:4b}] run function mny:glbs/check_money

# 10 出售物品
execute unless data entity @s Items[{Slot:10b}] run function mny:glbs/sell/pre

# 11 切换售货架
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:11b}] run data modify entity @s Tags set value ["GLBShop","GLBS2"]

# 12 玩家查询自身正在出售的物品
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:12b}] run data modify entity @s Tags set value ["GLBShop","GLBS3"]

# 13 玩家取回其被退回的物品
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:13b}] run data modify entity @s Tags set value ["GLBShop","GLBS4"]

# 14 玩家查询其历史购买的物品状态
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:14b}] run data modify entity @s Tags set value ["GLBShop","GLBS5"]

# 15 玩家查询其历史售出的物品状态
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:15b}] run data modify entity @s Tags set value ["GLBShop","GLBS6"]

# 21 玩家发起页数跳转
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:21b}] run function mny:glbs/minecart/go_page

# 22 玩家发起领取收益
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:22b}] run function mny:glbs/minecart/earn

# 23 玩家发起编号查找
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:23b}] run function mny:glbs/minecart/go_one

# 16 回到主菜单
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:16b}] run data modify entity @s Tags set value ["GLBShop","GLBS0"]

##if tag == GLBSmodify -> 玻璃板被取走,保持世界商店菜单
execute if entity @s[tag=GLBSmodify] run data modify entity @s Tags set value ["GLBShop","GLBS1"]