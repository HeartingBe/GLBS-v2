##管理员确认向回收商店添加该商品

# 10b 是商店物品
execute if data entity @s Items[{Slot:10b,tag:{glbs:{shop:1b}}}] run tellraw @p[distance=..5,tag=GLBSop] [">> \u00a7c需要放入回收物品"]

execute unless data entity @s Items[{Slot:10b,tag:{glbs:{shop:1b}}}] run function mny:glbs/minecart/edit/buy_add/ok_pre2