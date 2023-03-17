# 售货架商店矿车拥有的格数≤26 由其执行该函数 删除该函数

#根据缺漏 为了避免前面的通过而后面的混淆
#条件里继续追加检测矿车商店是否已经被修改
#依据的是mny:glbs/minecart/test函数中的modify标签

# 7 跳到某一页
execute unless data entity @s Items[{Slot:7b}] run function mny:glbs/minecart/go_page

# 25 跳到某个商品的页面
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:25b}] run function mny:glbs/minecart/go_one

# 8 上一页
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:8b}] run function mny:glbs/minecart/up

# 26 下一页
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:26b}] run function mny:glbs/minecart/down

# 16 返回主菜单
execute if entity @s[tag=GLBSmodify] unless data entity @s Items[{Slot:16b}] run data merge entity @s {Items:[],Tags:["GLBShop","GLBS1"]}

#如果此时还满足 tag=GLBSmodify 说明玻璃板被取走 或者玩家丢出了待售物品 只需重新填充矿车
execute if entity @s[tag=GLBSmodify] run data merge entity @s {Items:[],Tags:["GLBShop","GLBS2"]}