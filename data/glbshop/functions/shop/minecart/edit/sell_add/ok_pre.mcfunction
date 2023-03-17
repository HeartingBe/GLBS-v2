##管理员确认向出售商店添加该商品

# 10b 是商店物品
execute if data entity @s Items[{Slot:10b,tag:{glbs:{shop:1b}}}] run tellraw @p[distance=..5,tag=GLBSop] [">> \u00a7c需要放入出售商品"]

execute unless data entity @s Items[{Slot:10b,tag:{glbs:{shop:1b}}}] run function mny:glbs/minecart/edit/sell_add/ok_pre2